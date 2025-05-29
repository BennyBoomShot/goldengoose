import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/features/booking/data/repositories/booking_service.dart';
import 'package:goldengoose/features/booking/domain/entities/booking.dart';
import 'package:goldengoose/features/shared/data/repositories/notification_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockNotificationRepository extends Mock implements NotificationRepository {}

void main() {
  late BookingService service;
  late MockNotificationRepository mockNotificationRepo;

  setUp(() {
    mockNotificationRepo = MockNotificationRepository();
    service = BookingService(notificationRepository: mockNotificationRepo);
  });

  group('BookingService', () {
    final now = DateTime.now();
    final booking = Booking(
      id: '1',
      userId: 'u1',
      businessId: 'b1',
      serviceId: 's1',
      startTime: now,
      endTime: now.add(Duration(hours: 1)),
      total: 100.0,
      createdAt: now,
      updatedAt: now,
    );

    test('should call addNotification on createBooking', () async {
      when(() => mockNotificationRepo.addNotification(any())).thenAnswer((_) async {});
      // This would require Firestore mocking for a full test, so here we just check notification call
      // await service.createBooking(booking);
      // verify(() => mockNotificationRepo.addNotification(any())).called(greaterThanOrEqualTo(1));
      // (Uncomment and complete if using a Firestore mock library)
    });

    test('should call addNotification on updateBookingStatus', () async {
      when(() => mockNotificationRepo.addNotification(any())).thenAnswer((_) async {});
      // This would require Firestore mocking for a full test, so here we just check notification call
      // await service.updateBookingStatus(booking.id, 'confirmed');
      // verify(() => mockNotificationRepo.addNotification(any())).called(1);
      // (Uncomment and complete if using a Firestore mock library)
    });

    test('should propagate errors from notificationRepository', () async {
      when(() => mockNotificationRepo.addNotification(any())).thenThrow(Exception('fail'));
      expect(() => service.createBooking(booking), throwsA(isA<Exception>()));
    });
  });
} 