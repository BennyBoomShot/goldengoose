import '../../data/repositories/cart_repository.dart';
import '../entities/cart.dart';

class AddToCart {
  final CartRepository repository;
  AddToCart(this.repository);

  Future<void> call(String userId, CartItem item) async {
    await repository.addToCart(userId, item);
  }
} 