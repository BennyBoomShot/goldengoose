import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/features/booking/domain/entities/booking.dart';
import 'package:goldengoose/features/booking/domain/repositories/booking_repository.dart';
import 'package:goldengoose/features/booking/domain/use_cases/get_booking.dart';
import 'package:mocktail/mocktail.dart';

class MockBookingRepository extends Mock implements IBookingRepository {}

void main() {
  late MockBookingRepository mockRepo;
  late GetBooking usecase;

  setUp(() {
    mockRepo = MockBookingRepository();
    usecase = GetBooking(mockRepo);
  });

  group('GetBooking', () {
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

    test('calls repository.getBooking', () async {
      when(() => mockRepo.getBooking('1')).thenAnswer((_) async => booking);
      final result = await usecase('1');
      expect(result, booking);
      verify(() => mockRepo.getBooking('1')).called(1);
    });

    test('propagates errors from repository', () async {
      when(() => mockRepo.getBooking('1')).thenThrow(Exception('fail'));
      expect(() => usecase('1'), throwsA(isA<Exception>()));
    });
  });
} 