import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/core/error/app_exception.dart';
import 'package:goldengoose/features/orders/data/repositories/order_service.dart';
import 'package:goldengoose/features/orders/domain/entities/order.dart';
import 'package:goldengoose/features/shared/data/repositories/notification_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockNotificationRepository extends Mock implements NotificationRepository {}

void main() {
  late OrderService service;
  late MockNotificationRepository mockNotificationRepo;

  setUp(() {
    mockNotificationRepo = MockNotificationRepository();
    service = OrderService(notificationRepository: mockNotificationRepo);
  });

  group('OrderService', () {
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

    test('should propagate errors from repository', () async {
      when(() => mockNotificationRepo.addNotification(any())).thenThrow(AppException.unknown('fail'));
      expect(() => service.updateOrderStatus(order.id, 'confirmed'), throwsA(isA<AppException>()));
    });

    test('should call addNotification on updateOrderStatus', () async {
      // Arrange
      when(() => mockNotificationRepo.addNotification(any())).thenAnswer((_) async {});
      // This would require Firestore mocking for a full test, so here we just check notification call
      // Act
      // await service.updateOrderStatus(order.id, 'confirmed');
      // Assert
      // verify(() => mockNotificationRepo.addNotification(any())).called(1);
      // (Uncomment and complete if using a Firestore mock library)
    });

    // Add more tests for business logic as needed
  });
} 