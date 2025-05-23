import 'package:goldengoose/core/logger/app_logger.dart';
import 'package:goldengoose/data/repositories/firebase_repository.dart';
import 'package:goldengoose/features/cart/domain/entities/cart.dart';
import 'package:goldengoose/core/error/app_exception.dart';

class CartRepository extends FirebaseRepository<Cart> {
  CartRepository({
    required super.firebaseDataSource,
  }) : super(
          collection: 'carts',
          fromJson: (json) => Cart.fromJson(json),
          toJson: (cart) => cart.toJson(),
        );

  @override
  Future<Cart?> get(String id) async {
    try {
      return await super.get(id);
    } catch (e, st) {
      AppLogger.error('CartRepository.get error', e, st);
      throw AppException.unknown('Failed to get cart: $e');
    }
  }

  @override
  Future<List<Cart>> getAll() async {
    try {
      return await super.getAll();
    } catch (e, st) {
      AppLogger.error('CartRepository.getAll error', e, st);
      throw AppException.unknown('Failed to get carts: $e');
    }
  }

  @override
  Future<void> create(Cart item) async {
    try {
      await super.create(item);
    } catch (e, st) {
      AppLogger.error('CartRepository.create error', e, st);
      throw AppException.unknown('Failed to create cart: $e');
    }
  }

  @override
  Future<void> update(Cart item) async {
    try {
      await super.update(item);
    } catch (e, st) {
      AppLogger.error('CartRepository.update error', e, st);
      throw AppException.unknown('Failed to update cart: $e');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await super.delete(id);
    } catch (e, st) {
      AppLogger.error('CartRepository.delete error', e, st);
      throw AppException.unknown('Failed to delete cart: $e');
    }
  }
} 