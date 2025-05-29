import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/features/booking/domain/entities/booking.dart';
import 'package:goldengoose/features/booking/domain/repositories/booking_repository.dart';
import 'package:goldengoose/features/booking/domain/use_cases/get_upcoming_bookings.dart';
import 'package:mocktail/mocktail.dart';

class MockBookingRepository extends Mock implements IBookingRepository {}

void main() {
  late MockBookingRepository mockRepo;
  late GetUpcomingBookings usecase;

  setUp(() {
    mockRepo = MockBookingRepository();
    usecase = GetUpcomingBookings(mockRepo);
  });

  group('GetUpcomingBookings', () {
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

    test('calls repository.getUpcomingBookings', () async {
      when(() => mockRepo.getUpcomingBookings('u1')).thenAnswer((_) async => bookings);
      final result = await usecase('u1');
      expect(result, bookings);
      verify(() => mockRepo.getUpcomingBookings('u1')).called(1);
    });

    test('propagates errors from repository', () async {
      when(() => mockRepo.getUpcomingBookings('u1')).thenThrow(Exception('fail'));
      expect(() => usecase('u1'), throwsA(isA<Exception>()));
    });
  });
} 