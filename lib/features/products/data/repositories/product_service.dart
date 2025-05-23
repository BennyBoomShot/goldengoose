import 'dart:typed_data';
import 'package:goldengoose/features/products/data/repositories/product_repository.dart';
import 'package:goldengoose/features/products/domain/entities/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final ProductRepository productRepository;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ProductService({required this.productRepository});

  /// Gets all products for a specific business.
  Future<List<Product>> getProductsByBusiness(String businessId) async {
    final snapshot = await _firestore
        .collection('products')
        .where('businessId', isEqualTo: businessId)
        .get();
    return snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList();
  }

  /// Gets all products in a specific category.
  Future<List<Product>> getProductsByCategory(String category) async {
    final snapshot = await _firestore
        .collection('products')
        .where('category', isEqualTo: category)
        .get();
    return snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList();
  }

  /// Searches products by name or description (case-insensitive, simple contains).
  Future<List<Product>> searchProducts(String query) async {
    final snapshot = await _firestore.collection('products').get();
    final lowerQuery = query.toLowerCase();
    return snapshot.docs
        .map((doc) => Product.fromJson(doc.data()))
        .where((product) => product.name.toLowerCase().contains(lowerQuery) ||
            product.description.toLowerCase().contains(lowerQuery))
        .toList();
  }

  /// Sets a product's active status.
  Future<void> setProductActive(String productId, bool isActive) async {
    await _firestore.collection('products').doc(productId).update({'isActive': isActive});
  }

  /// Uploads a product image and adds the URL to the product's images list.
  Future<void> uploadProductImage(String productId, Uint8List imageBytes) async {
    final ref = _firestore.collection('products').doc(productId);
    final imagePath = 'products/$productId/${DateTime.now().millisecondsSinceEpoch}.jpg';
    // Assume you have a method in productRepository to upload files
    final imageUrl = await productRepository.uploadFile(imagePath, imageBytes);
    final doc = await ref.get();
    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      final images = List<String>.from(data['images'] ?? []);
      images.add(imageUrl);
      await ref.update({'images': images});
    }
  }

  /// Updates the stock quantity for a product.
  Future<void> updateStockQuantity(String productId, int newQuantity) async {
    await _firestore.collection('products').doc(productId).update({'stockQuantity': newQuantity});
  }

  /// Increments the product's view count (for analytics).
  Future<void> incrementProductView(String productId) async {
    final ref = _firestore.collection('products').doc(productId);
    await ref.update({'views': FieldValue.increment(1)});
  }

  /// Adds a review to a product and updates average rating.
  Future<void> addReview(String productId, String userId, String review, int rating) async {
    final ref = _firestore.collection('products').doc(productId).collection('reviews');
    await ref.add({
      'userId': userId,
      'review': review,
      'rating': rating,
      'timestamp': DateTime.now().toIso8601String(),
    });
    await updateAverageRating(productId);
  }

  /// Gets all reviews for a product.
  Future<List<Map<String, dynamic>>> getReviews(String productId) async {
    final snapshot = await _firestore.collection('products').doc(productId).collection('reviews').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  /// Updates the average rating for a product.
  Future<void> updateAverageRating(String productId) async {
    final reviews = await getReviews(productId);
    if (reviews.isEmpty) return;
    final avg = reviews.map((r) => r['rating'] as int).reduce((a, b) => a + b) / reviews.length;
    await _firestore.collection('products').doc(productId).update({'averageRating': avg});
  }

  /// Sets a discount for a product.
  Future<void> setDiscount(String productId, double discountPrice, DateTime start, DateTime end) async {
    await _firestore.collection('products').doc(productId).update({
      'discountPrice': discountPrice,
      'discountStart': start.toIso8601String(),
      'discountEnd': end.toIso8601String(),
    });
  }

  /// Clears the discount for a product.
  Future<void> clearDiscount(String productId) async {
    await _firestore.collection('products').doc(productId).update({
      'discountPrice': FieldValue.delete(),
      'discountStart': FieldValue.delete(),
      'discountEnd': FieldValue.delete(),
    });
  }

  /// Adds a tag to a product.
  Future<void> addTag(String productId, String tag) async {
    await _firestore.collection('products').doc(productId).update({
      'tags': FieldValue.arrayUnion([tag])
    });
  }

  /// Removes a tag from a product.
  Future<void> removeTag(String productId, String tag) async {
    await _firestore.collection('products').doc(productId).update({
      'tags': FieldValue.arrayRemove([tag])
    });
  }

  /// Adds a variant to a product.
  Future<void> addVariant(String productId, Map<String, dynamic> variant) async {
    await _firestore.collection('products').doc(productId).update({
      'variants': FieldValue.arrayUnion([variant])
    });
  }

  /// Removes a variant from a product.
  Future<void> removeVariant(String productId, Map<String, dynamic> variant) async {
    await _firestore.collection('products').doc(productId).update({
      'variants': FieldValue.arrayRemove([variant])
    });
  }

  /// Soft deletes a product (marks as deleted).
  Future<void> softDeleteProduct(String productId) async {
    await _firestore.collection('products').doc(productId).update({'isDeleted': true});
  }

  /// Restores a soft-deleted product.
  Future<void> restoreProduct(String productId) async {
    await _firestore.collection('products').doc(productId).update({'isDeleted': false});
  }

  /// Increments the sales count for a product.
  Future<void> incrementSales(String productId, int quantity) async {
    await _firestore.collection('products').doc(productId).update({'sales': FieldValue.increment(quantity)});
  }

  /// Gets sales stats for a product.
  Future<int> getSalesStats(String productId) async {
    final doc = await _firestore.collection('products').doc(productId).get();
    final data = doc.data();
    return data?['sales'] ?? 0;
  }

  /// Bulk import products from a list of maps.
  Future<void> importProducts(List<Map<String, dynamic>> products) async {
    final batch = _firestore.batch();
    for (final product in products) {
      final ref = _firestore.collection('products').doc(product['id']);
      batch.set(ref, product);
    }
    await batch.commit();
  }

  /// Export all products as a list of maps.
  Future<List<Map<String, dynamic>>> exportProducts() async {
    final snapshot = await _firestore.collection('products').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  /// Adds a product to a user's favorites.
  Future<void> addFavorite(String userId, String productId) async {
    await _firestore.collection('users').doc(userId).collection('favorites').doc(productId).set({'addedAt': DateTime.now().toIso8601String()});
  }

  /// Removes a product from a user's favorites.
  Future<void> removeFavorite(String userId, String productId) async {
    await _firestore.collection('users').doc(userId).collection('favorites').doc(productId).delete();
  }

  /// Sets available locations for a product.
  Future<void> setAvailableLocations(String productId, List<String> locations) async {
    await _firestore.collection('products').doc(productId).update({'availableLocations': locations});
  }

  /// Checks if a product is available in a given location.
  Future<bool> isAvailableInLocation(String productId, String location) async {
    final doc = await _firestore.collection('products').doc(productId).get();
    final data = doc.data();
    final locations = List<String>.from(data?['availableLocations'] ?? []);
    return locations.contains(location);
  }
} 