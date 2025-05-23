import '../entities/order.dart';

abstract class IOrderRepository {
  Future<void> createOrder(Order order);
  Future<Order?> getOrder(String orderId);
  Future<void> updateOrder(Order order);
  Future<void> cancelOrder(String orderId);
  Future<List<Order>> listOrders();
  Future<List<Order>> listOrdersByUser(String userId);
  Future<List<Order>> listOrdersByBusiness(String businessId);
} 