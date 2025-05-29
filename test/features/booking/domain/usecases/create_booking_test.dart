import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/features/booking/domain/entities/booking.dart';
import 'package:goldengoose/features/booking/domain/repositories/booking_repository.dart';
import 'package:goldengoose/features/booking/domain/use_cases/create_booking.dart';
import 'package:mocktail/mocktail.dart';

class MockBookingRepository extends Mock implements IBookingRepository {}

void main() {
  late MockBookingRepository mockRepo;
  late CreateBooking usecase;

  setUp(() {
    mockRepo = MockBookingRepository();
    usecase = CreateBooking(mockRepo);
  });

  group('CreateBooking', () {
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

    test('calls repository.createBooking', () async {
      when(() => mockRepo.createBooking(booking)).thenAnswer((_) async {});
      await usecase(booking);
      verify(() => mockRepo.createBooking(booking)).called(1);
    });

    test('propagates errors from repository', () async {
      when(() => mockRepo.createBooking(booking)).thenThrow(Exception('fail'));
      expect(() => usecase(booking), throwsA(isA<Exception>()));
    });
  });
} 