import '../../data/repositories/cart_repository.dart';

class RemoveFromCart {
  final CartRepository repository;
  RemoveFromCart(this.repository);

  Future<void> call(String userId, String itemId) async {
    await repository.removeFromCart(userId, itemId);
  }
} 