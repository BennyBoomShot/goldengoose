import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

import '../../../shared/data/repositories/notification_repository.dart';
import '../../../shared/models/notification.dart';
import '../../domain/entities/order.dart' as domain;

class OrderService {
  final firestore.FirebaseFirestore _firestore = firestore.FirebaseFirestore.instance;
  final NotificationRepository notificationRepository;

  OrderService({required this.notificationRepository});

  /// Creates a new order in Firestore.
  Future<void> createOrder(domain.Order order) async {
    await _firestore.collection('orders').doc(order.id).set(order.toJson());
  }

  /// Gets an order by ID.
  Future<domain.Order?> getOrder(String orderId) async {
    final doc = await _firestore.collection('orders').doc(orderId).get();
    if (!doc.exists) return null;
    return domain.Order.fromJson(doc.data() as Map<String, dynamic>);
  }

  /// Updates an order in Firestore.
  Future<void> updateOrder(domain.Order order) async {
    await _firestore.collection('orders').doc(order.id).update(order.toJson());
  }

  /// Deletes an order from Firestore.
  Future<void> deleteOrder(String orderId) async {
    await _firestore.collection('orders').doc(orderId).delete();
  }

  /// Lists all orders for a specific user.
  Future<List<domain.Order>> listOrdersByUser(String userId) async {
    final snapshot = await _firestore.collection('orders').where('userId', isEqualTo: userId).get();
    return snapshot.docs.map((doc) => domain.Order.fromJson(doc.data())).toList();
  }

  /// Lists all orders for a specific business.
  Future<List<domain.Order>> listOrdersByBusiness(String businessId) async {
    final snapshot = await _firestore.collection('orders').where('businessId', isEqualTo: businessId).get();
    return snapshot.docs.map((doc) => domain.Order.fromJson(doc.data())).toList();
  }

  /// Updates the status of an order and notifies the user.
  Future<void> updateOrderStatus(String orderId, String status) async {
    await _firestore.collection('orders').doc(orderId).update({'status': status});
    // Fetch order and user info
    final orderDoc = await _firestore.collection('orders').doc(orderId).get();
    final order = domain.Order.fromJson(orderDoc.data() as Map<String, dynamic>);
    final notification = AppNotification(
      id: '${orderId}_${DateTime.now().millisecondsSinceEpoch}',
      userId: order.userId,
      type: NotificationType.orderUpdate,
      title: 'Order Status Updated',
      message: 'Your order status is now $status.',
      createdAt: DateTime.now(),
    );
    await notificationRepository.addNotification(notification);
  }

  /// Adds an item to an order's items list.
  Future<void> addOrderItem(String orderId, Map<String, dynamic> item) async {
    await _firestore.collection('orders').doc(orderId).update({
      'items': firestore.FieldValue.arrayUnion([item])
    });
  }

  /// Sets payment info for an order.
  Future<void> setPaymentInfo(String orderId, Map<String, dynamic> paymentInfo) async {
    await _firestore.collection('orders').doc(orderId).update({'paymentInfo': paymentInfo});
  }

  /// Gets order history for a user (sorted by createdAt desc).
  Future<List<domain.Order>> getOrderHistory(String userId) async {
    final snapshot = await _firestore
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .get();
    return snapshot.docs.map((doc) => domain.Order.fromJson(doc.data())).toList();
  }

  /// Gets order analytics for a business (total orders, total sales).
  Future<Map<String, dynamic>> getOrderAnalytics(String businessId) async {
    final snapshot = await _firestore.collection('orders').where('businessId', isEqualTo: businessId).get();
    final orders = snapshot.docs.map((doc) => domain.Order.fromJson(doc.data())).toList();
    final totalOrders = orders.length;
    final totalSales = orders.fold<double>(0, (sum, order) => sum + (order.total));
    return {
      'totalOrders': totalOrders,
      'totalSales': totalSales,
    };
  }

  /// Adds a notification to an order's notifications subcollection.
  Future<void> addOrderNotification(String orderId, String message) async {
    await _firestore.collection('orders').doc(orderId).collection('notifications').add({
      'message': message,
      'timestamp': DateTime.now().toIso8601String(),
      'read': false,
    });
  }
} 