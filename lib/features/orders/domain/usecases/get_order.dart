import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetOrder {
  final IOrderRepository repository;
  GetOrder(this.repository);

  Future<Order?> call(String orderId) {
    return repository.getOrder(orderId);
  }
} 