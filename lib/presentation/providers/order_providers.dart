import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/remote/firebase/firebase_data_source.dart';
import '../../features/orders/data/repositories/order_repository.dart';
import '../../features/orders/domain/use_cases/cancel_order.dart';
import '../../features/orders/domain/use_cases/create_order.dart';
import '../../features/orders/domain/use_cases/get_order.dart';
import '../../features/orders/domain/use_cases/list_orders.dart';
import '../../features/orders/domain/use_cases/list_orders_by_business.dart';
import '../../features/orders/domain/use_cases/list_orders_by_user.dart';
import '../../features/orders/domain/use_cases/update_order.dart';

final firebaseDataSourceProvider = Provider<FirebaseDataSource>((ref) => FirebaseDataSource());

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final firebaseDataSource = ref.read(firebaseDataSourceProvider);
  return OrderRepository(firebaseDataSource: firebaseDataSource);
});

final createOrderProvider = Provider<CreateOrder>((ref) {
  final repo = ref.read(orderRepositoryProvider);
  return CreateOrder(repo);
});

final getOrderProvider = Provider<GetOrder>((ref) {
  final repo = ref.read(orderRepositoryProvider);
  return GetOrder(repo);
});

final updateOrderProvider = Provider<UpdateOrder>((ref) {
  final repo = ref.read(orderRepositoryProvider);
  return UpdateOrder(repo);
});

final cancelOrderProvider = Provider<CancelOrder>((ref) {
  final repo = ref.read(orderRepositoryProvider);
  return CancelOrder(repo);
});

final listOrdersProvider = Provider<ListOrders>((ref) {
  final repo = ref.read(orderRepositoryProvider);
  return ListOrders(repo);
});

final listOrdersByUserProvider = Provider<ListOrdersByUser>((ref) {
  final repo = ref.read(orderRepositoryProvider);
  return ListOrdersByUser(repo);
});

final listOrdersByBusinessProvider = Provider<ListOrdersByBusiness>((ref) {
  final repo = ref.read(orderRepositoryProvider);
  return ListOrdersByBusiness(repo);
}); 