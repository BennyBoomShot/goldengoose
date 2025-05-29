import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/features/booking/domain/repositories/booking_repository.dart';
import 'package:goldengoose/features/booking/domain/use_cases/delete_booking.dart';
import 'package:mocktail/mocktail.dart';

class MockBookingRepository extends Mock implements IBookingRepository {}

void main() {
  late MockBookingRepository mockRepo;
  late DeleteBooking usecase;

  setUp(() {
    mockRepo = MockBookingRepository();
    usecase = DeleteBooking(mockRepo);
  });

  group('DeleteBooking', () {
    test('calls repository.deleteBooking', () async {
      when(() => mockRepo.deleteBooking('1')).thenAnswer((_) async {});
      await usecase('1');
      verify(() => mockRepo.deleteBooking('1')).called(1);
    });

    test('propagates errors from repository', () async {
      when(() => mockRepo.deleteBooking('1')).thenThrow(Exception('fail'));
      expect(() => usecase('1'), throwsA(isA<Exception>()));
    });
  });
} 