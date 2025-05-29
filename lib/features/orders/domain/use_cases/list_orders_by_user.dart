import '../entities/order.dart';
import '../repositories/order_repository.dart';

class ListOrdersByUser {
  final IOrderRepository repository;
  ListOrdersByUser(this.repository);

  Future<List<Order>> call(String userId) {
    return repository.listOrdersByUser(userId);
  }
} 