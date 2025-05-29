import '../repositories/order_repository.dart';

class CancelOrder {
  final IOrderRepository repository;
  CancelOrder(this.repository);

  Future<void> call(String orderId) {
    return repository.cancelOrder(orderId);
  }
} 