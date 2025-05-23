import '../entities/order.dart';
import '../repositories/order_repository.dart';

class ListOrders {
  final IOrderRepository repository;
  ListOrders(this.repository);

  Future<List<Order>> call() {
    return repository.listOrders();
  }
} 