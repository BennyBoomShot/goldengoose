import '../entities/cart.dart';
import '../../data/repositories/cart_repository.dart';

class GetCart {
  final CartRepository repository;
  GetCart(this.repository);

  Future<Cart?> call(String userId) async {
    return await repository.getCart(userId);
  }
} 