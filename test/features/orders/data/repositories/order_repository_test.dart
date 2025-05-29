import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/core/error/app_exception.dart';
import 'package:goldengoose/data/datasources/remote/firebase/firebase_data_source.dart';
import 'package:goldengoose/features/orders/data/repositories/order_repository.dart';
import 'package:goldengoose/features/orders/domain/entities/order.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseDataSource extends Mock implements FirebaseDataSource {}

void main() {
  late OrderRepository repository;
  late MockFirebaseDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockFirebaseDataSource();
    repository = OrderRepository(firebaseDataSource: mockDataSource);
  });

  group('OrderRepository', () {
    final order = Order(
      id: '1',
      userId: 'u1',
      businessId: 'b1',
      items: [],
      total: 100.0,
      status: OrderStatus.pending,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    test('should throw AppException.unknown on get error', () async {
      when(() => mockDataSource.firestore.collection(any()).doc(any()).get()).thenThrow(Exception('fail'));
      expect(() => repository.get('bad_id'), throwsA(isA<AppException>()));
    });

    test('should throw AppException.unknown on create error', () async {
      when(() => mockDataSource.firestore.collection(any()).doc(any()).get()).thenThrow(Exception('fail'));
      expect(() => repository.create(order), throwsA(isA<AppException>()));
    });

    test('should throw AppException.unknown on update error', () async {
      when(() => mockDataSource.firestore.collection(any()).doc(any()).get()).thenThrow(Exception('fail'));
      expect(() => repository.update(order), throwsA(isA<AppException>()));
    });

    test('should throw AppException.unknown on delete error', () async {
      when(() => mockDataSource.firestore.collection(any()).doc(any()).get()).thenThrow(Exception('fail'));
      expect(() => repository.delete('bad_id'), throwsA(isA<AppException>()));
    });
  });
} 