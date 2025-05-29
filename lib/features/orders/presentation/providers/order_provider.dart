import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/datasources/remote/firebase/firebase_data_source.dart';
import '../../data/repositories/order_repository.dart';
import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';

final firebaseDataSourceProvider = Provider<FirebaseDataSource>((ref) {
  final dataSource = FirebaseDataSource();
  // Optionally, call initialize() somewhere in your app startup
  return dataSource;
});

final orderRepositoryProvider = Provider<IOrderRepository>((ref) {
  final firebaseDataSource = ref.watch(firebaseDataSourceProvider);
  return OrderRepository(firebaseDataSource: firebaseDataSource);
});

class OrderListNotifier extends StateNotifier<AsyncValue<List<Order>>> {
  final IOrderRepository repository;
  final String userId;

  OrderListNotifier({required this.repository, required this.userId}) : super(const AsyncValue.loading()) {
    loadOrders();
  }

  Future<void> loadOrders() async {
    state = const AsyncValue.loading();
    try {
      final orders = await repository.listOrdersByUser(userId);
      state = AsyncValue.data(orders);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addOrder(Order order) async {
    try {
      await repository.createOrder(order);
      await loadOrders();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateOrder(Order order) async {
    try {
      await repository.updateOrder(order);
      await loadOrders();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> cancelOrder(String orderId) async {
    try {
      await repository.cancelOrder(orderId);
      await loadOrders();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final orderListProvider = StateNotifierProvider.family<OrderListNotifier, AsyncValue<List<Order>>, String>((ref, userId) {
  final repository = ref.watch(orderRepositoryProvider);
  return OrderListNotifier(repository: repository, userId: userId);
}); 