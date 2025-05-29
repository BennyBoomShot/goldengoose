import '../../../../core/error/app_exception.dart';
import '../../../../core/logger/app_logger.dart';
import '../../../../data/repositories/firebase_repository.dart';
import '../../domain/entities/product.dart';

class ProductRepository extends FirebaseRepository<Product> {
  ProductRepository({
    required super.firebaseDataSource,
  }) : super(
          collection: 'products',
          fromJson: (json) => Product.fromJson(json),
          toJson: (product) => product.toJson(),
        );

  @override
  Future<Product?> get(String id) async {
    try {
      return await super.get(id);
    } catch (e, st) {
      AppLogger.error('ProductRepository.get error', e, st);
      throw AppException.unknown('Failed to get product: $e');
    }
  }

  @override
  Future<List<Product>> getAll() async {
    try {
      return await super.getAll();
    } catch (e, st) {
      AppLogger.error('ProductRepository.getAll error', e, st);
      throw AppException.unknown('Failed to get products: $e');
    }
  }

  @override
  Future<void> create(Product item) async {
    try {
      await super.create(item);
    } catch (e, st) {
      AppLogger.error('ProductRepository.create error', e, st);
      throw AppException.unknown('Failed to create product: $e');
    }
  }

  @override
  Future<void> update(Product item) async {
    try {
      await super.update(item);
    } catch (e, st) {
      AppLogger.error('ProductRepository.update error', e, st);
      throw AppException.unknown('Failed to update product: $e');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await super.delete(id);
    } catch (e, st) {
      AppLogger.error('ProductRepository.delete error', e, st);
      throw AppException.unknown('Failed to delete product: $e');
    }
  }
} 