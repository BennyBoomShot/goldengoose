import '../../../../core/error/app_exception.dart';
import '../../../../core/logger/app_logger.dart';
import '../../../../data/repositories/firebase_repository.dart';
import '../../domain/entities/cart.dart';

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

  // Cart-specific methods
  Future<void> addToCart(String userId, CartItem item) async {
    final cart = await get(userId) ?? Cart(
      id: userId,
      userId: userId,
      items: [],
      totalAmount: 0.0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    final updatedItems = List<CartItem>.from(cart.items)..add(item);
    final updatedTotal = updatedItems.fold<double>(0, (sum, i) => sum + (i.price * i.quantity));
    final updatedCart = cart.copyWith(
      items: updatedItems,
      totalAmount: updatedTotal,
      updatedAt: DateTime.now(),
    );
    await update(updatedCart);
  }

  Future<void> removeFromCart(String userId, String itemId) async {
    final cart = await get(userId);
    if (cart == null) return;
    final updatedItems = cart.items.where((i) => i.id != itemId).toList();
    final updatedTotal = updatedItems.fold<double>(0, (sum, i) => sum + (i.price * i.quantity));
    final updatedCart = cart.copyWith(
      items: updatedItems,
      totalAmount: updatedTotal,
      updatedAt: DateTime.now(),
    );
    await update(updatedCart);
  }

  Future<Cart?> getCart(String userId) async {
    return await get(userId);
  }

  Future<void> updateCartItem(String userId, CartItem updatedItem) async {
    final cart = await get(userId);
    if (cart == null) return;
    final updatedItems = cart.items.map((i) => i.id == updatedItem.id ? updatedItem : i).toList();
    final updatedTotal = updatedItems.fold<double>(0, (sum, i) => sum + (i.price * i.quantity));
    final updatedCart = cart.copyWith(
      items: updatedItems,
      totalAmount: updatedTotal,
      updatedAt: DateTime.now(),
    );
    await update(updatedCart);
  }
} 

