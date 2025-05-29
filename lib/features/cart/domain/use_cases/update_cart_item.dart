import '../../data/repositories/cart_repository.dart';
import '../entities/cart.dart';

class UpdateCartItem {
  final CartRepository repository;
  UpdateCartItem(this.repository);

  Future<void> call(String userId, CartItem item) async {
    await repository.updateCartItem(userId, item);
  }
} 