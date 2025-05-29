import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/features/booking/domain/entities/booking.dart';
import 'package:goldengoose/features/booking/domain/repositories/booking_repository.dart';
import 'package:goldengoose/features/booking/domain/use_cases/get_bookings_by_date_range.dart';
import 'package:mocktail/mocktail.dart';

class MockBookingRepository extends Mock implements IBookingRepository {}

void main() {
  late MockBookingRepository mockRepo;
  late GetBookingsByDateRange usecase;

  setUp(() {
    mockRepo = MockBookingRepository();
    usecase = GetBookingsByDateRange(mockRepo);
  });

  group('GetBookingsByDateRange', () {
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
    final bookings = [booking];

    test('calls repository.getBookingsByDateRange', () async {
      when(() => mockRepo.getBookingsByDateRange('b1', now, now)).thenAnswer((_) async => bookings);
      final result = await usecase('b1', now, now);
      expect(result, bookings);
      verify(() => mockRepo.getBookingsByDateRange('b1', now, now)).called(1);
    });

    test('propagates errors from repository', () async {
      when(() => mockRepo.getBookingsByDateRange('b1', now, now)).thenThrow(Exception('fail'));
      expect(() => usecase('b1', now, now), throwsA(isA<Exception>()));
    });
  });
} 