import 'package:goldengoose/core/logger/app_logger.dart';
import 'package:goldengoose/data/datasources/remote/firebase/firebase_data_source.dart';
import 'package:goldengoose/data/repositories/firebase_repository.dart';
import 'package:goldengoose/features/orders/domain/entities/order.dart';
import 'package:goldengoose/core/error/app_exception.dart';

class OrderRepository extends FirebaseRepository<Order> {
  OrderRepository({
    required FirebaseDataSource firebaseDataSource,
  }) : super(
          firebaseDataSource: firebaseDataSource,
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
} 