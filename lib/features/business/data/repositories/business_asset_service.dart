import 'dart:io';
import 'package:goldengoose/data/datasources/remote/firebase/firebase_data_source.dart';
import 'package:goldengoose/features/products/data/repositories/product_repository.dart';
import 'package:goldengoose/features/products/domain/entities/product.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

class BusinessAssetService {
  final FirebaseDataSource firebaseDataSource;
  final ProductRepository productRepository;
  final Uuid _uuid = const Uuid();

  BusinessAssetService({
    required this.firebaseDataSource,
    required this.productRepository,
  });

  /// Uploads a logo image to Firebase Storage and returns the download URL.
  Future<String> uploadLogo({
    required String businessId,
    required String imagePath,
  }) async {
    final file = File(imagePath);
    final bytes = await file.readAsBytes();
    final ext = p.extension(imagePath);
    final storagePath = 'businesses/$businessId/logo$ext';
    return await productRepository.uploadFile(storagePath, bytes);
  }

  /// Parses menu text and saves each product to Firestore.
  /// Returns the list of created products.
  Future<List<Product>> saveMenuProducts({
    required String businessId,
    required String menuText,
  }) async {
    final now = DateTime.now();
    final products = _parseMenuTextToProducts(menuText, businessId, now);
    for (final product in products) {
      await productRepository.create(product);
    }
    return products;
  }

  /// Internal: Parses menu text into Product models with required fields.
  List<Product> _parseMenuTextToProducts(String menuText, String businessId, DateTime now) {
    final lines = menuText.split('\n');
    return lines.map((line) {
      final parts = line.split('-');
      final name = parts[0].trim();
      double price = 0.0;
      if (parts.length > 1) {
        final priceString = parts[1].replaceAll(RegExp(r'[^0-9.]'), '');
        price = double.tryParse(priceString) ?? 0.0;
      }
      return Product(
        id: _uuid.v4(),
        businessId: businessId,
        name: name,
        description: '',
        price: price,
        stockQuantity: 0,
        images: [],
        category: null,
        isActive: true,
        createdAt: now,
        updatedAt: now,
      );
    }).where((product) => product.name.isNotEmpty).toList();
  }

  /// Updates the business document with the logo URL in Firestore.
  Future<void> saveLogoUrlToBusiness({
    required String businessId,
    required String logoUrl,
  }) async {
    await firebaseDataSource.firestore
        .collection('businesses')
        .doc(businessId)
        .update({'logoUrl': logoUrl});
  }
} 