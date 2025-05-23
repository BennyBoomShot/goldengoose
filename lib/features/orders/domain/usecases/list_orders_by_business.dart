import '../entities/order.dart';
import '../repositories/order_repository.dart';

class ListOrdersByBusiness {
  final IOrderRepository repository;
  ListOrdersByBusiness(this.repository);

  Future<List<Order>> call(String businessId) {
    return repository.listOrdersByBusiness(businessId);
  }
} 