import 'package:goldengoose/core/logger/app_logger.dart';
import 'package:goldengoose/data/repositories/firebase_repository.dart';
import 'package:goldengoose/features/orders/domain/entities/order.dart';
import 'package:goldengoose/core/error/app_exception.dart';
import '../../domain/repositories/order_repository.dart';

class OrderRepository extends FirebaseRepository<Order> implements IOrderRepository {
  OrderRepository({
    required super.firebaseDataSource,
  }) : super(
          collection: 'orders',
          fromJson: (json) => Order.fromJson(json),
          toJson: (order) => order.toJson(),
        );

  @override
  Future<Order?> get(String id) async {
    try {
      return await super.get(id);
    } catch (e, st) {
      AppLogger.error('OrderRepository.get error', e, st);
      throw AppException.unknown('Failed to get order: $e');
    }
  }

  @override
  Future<List<Order>> getAll() async {
    try {
      return await super.getAll();
    } catch (e, st) {
      AppLogger.error('OrderRepository.getAll error', e, st);
      throw AppException.unknown('Failed to get orders: $e');
    }
  }

  @override
  Future<void> create(Order item) async {
    try {
      await super.create(item);
    } catch (e, st) {
      AppLogger.error('OrderRepository.create error', e, st);
      throw AppException.unknown('Failed to create order: $e');
    }
  }

  @override
  Future<void> update(Order item) async {
    try {
      await super.update(item);
    } catch (e, st) {
      AppLogger.error('OrderRepository.update error', e, st);
      throw AppException.unknown('Failed to update order: $e');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await super.delete(id);
    } catch (e, st) {
      AppLogger.error('OrderRepository.delete error', e, st);
      throw AppException.unknown('Failed to delete order: $e');
    }
  }

  // IOrderRepository methods
  @override
  Future<void> createOrder(Order order) => create(order);

  @override
  Future<Order?> getOrder(String orderId) => get(orderId);

  @override
  Future<void> updateOrder(Order order) => update(order);

  @override
  Future<void> cancelOrder(String orderId) async {
    final order = await get(orderId);
    if (order == null) throw AppException.notFound('Order not found');
    final updatedOrder = order.copyWith(status: OrderStatus.cancelled);
    await update(updatedOrder);
  }

  @override
  Future<List<Order>> listOrders() => getAll();

  @override
  Future<List<Order>> listOrdersByUser(String userId) async {
    try {
      final querySnapshot = await firebaseDataSource.firestore
          .collection(collection)
          .where('userId', isEqualTo: userId)
          .get();
      return querySnapshot.docs.map((doc) => fromJson(doc.data())).toList();
    } catch (e) {
      throw AppException.unknown('Failed to list orders by user: $e');
    }
  }

  @override
  Future<List<Order>> listOrdersByBusiness(String businessId) async {
    try {
      final querySnapshot = await firebaseDataSource.firestore
          .collection(collection)
          .where('businessId', isEqualTo: businessId)
          .get();
      return querySnapshot.docs.map((doc) => fromJson(doc.data())).toList();
    } catch (e) {
      throw AppException.unknown('Failed to list orders by business: $e');
    }
  }
} 