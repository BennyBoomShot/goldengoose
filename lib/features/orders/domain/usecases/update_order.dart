import '../entities/order.dart';
import '../repositories/order_repository.dart';

class UpdateOrder {
  final IOrderRepository repository;
  UpdateOrder(this.repository);

  Future<void> call(Order order) {
    return repository.updateOrder(order);
  }
} 