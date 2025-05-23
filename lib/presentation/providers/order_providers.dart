import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goldengoose/features/orders/data/repositories/order_repository.dart';
import 'package:goldengoose/features/orders/domain/usecases/create_order.dart';
import 'package:goldengoose/features/orders/domain/usecases/get_order.dart';
import 'package:goldengoose/features/orders/domain/usecases/update_order.dart';
import 'package:goldengoose/features/orders/domain/usecases/cancel_order.dart';
import 'package:goldengoose/features/orders/domain/usecases/list_orders.dart';
import 'package:goldengoose/features/orders/domain/usecases/list_orders_by_user.dart';
import 'package:goldengoose/features/orders/domain/usecases/list_orders_by_business.dart';
import 'package:goldengoose/data/datasources/remote/firebase/firebase_data_source.dart';

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