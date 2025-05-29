import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/features/booking/domain/entities/booking.dart';
import 'package:goldengoose/features/booking/domain/repositories/booking_repository.dart';
import 'package:goldengoose/features/booking/domain/use_cases/update_booking.dart';
import 'package:mocktail/mocktail.dart';

class MockBookingRepository extends Mock implements IBookingRepository {}

void main() {
  late MockBookingRepository mockRepo;
  late UpdateBooking usecase;

  setUp(() {
    mockRepo = MockBookingRepository();
    usecase = UpdateBooking(mockRepo);
  });

  group('UpdateBooking', () {
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

    test('calls repository.updateBooking', () async {
      when(() => mockRepo.updateBooking(booking)).thenAnswer((_) async {});
      await usecase(booking);
      verify(() => mockRepo.updateBooking(booking)).called(1);
    });

    test('propagates errors from repository', () async {
      when(() => mockRepo.updateBooking(booking)).thenThrow(Exception('fail'));
      expect(() => usecase(booking), throwsA(isA<Exception>()));
    });
  });
} 