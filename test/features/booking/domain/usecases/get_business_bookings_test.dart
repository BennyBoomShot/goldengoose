import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/features/booking/domain/entities/booking.dart';
import 'package:goldengoose/features/booking/domain/repositories/booking_repository.dart';
import 'package:goldengoose/features/booking/domain/use_cases/get_business_bookings.dart';
import 'package:mocktail/mocktail.dart';

class MockBookingRepository extends Mock implements IBookingRepository {}

void main() {
  late MockBookingRepository mockRepo;
  late GetBusinessBookings usecase;

  setUp(() {
    mockRepo = MockBookingRepository();
    usecase = GetBusinessBookings(mockRepo);
  });

  group('GetBusinessBookings', () {
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

    test('calls repository.getBusinessBookings', () async {
      when(() => mockRepo.getBusinessBookings('b1')).thenAnswer((_) async => bookings);
      final result = await usecase('b1');
      expect(result, bookings);
      verify(() => mockRepo.getBusinessBookings('b1')).called(1);
    });

    test('propagates errors from repository', () async {
      when(() => mockRepo.getBusinessBookings('b1')).thenThrow(Exception('fail'));
      expect(() => usecase('b1'), throwsA(isA<Exception>()));
    });
  });
} 