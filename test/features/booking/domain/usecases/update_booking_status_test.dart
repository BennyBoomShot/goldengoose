import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/features/booking/domain/entities/booking.dart';
import 'package:goldengoose/features/booking/domain/repositories/booking_repository.dart';
import 'package:goldengoose/features/booking/domain/use_cases/update_booking_status.dart';
import 'package:mocktail/mocktail.dart';

class MockBookingRepository extends Mock implements IBookingRepository {}

void main() {
  late MockBookingRepository mockRepo;
  late UpdateBookingStatus usecase;

  setUp(() {
    mockRepo = MockBookingRepository();
    usecase = UpdateBookingStatus(mockRepo);
  });

  group('UpdateBookingStatus', () {
    test('calls repository.updateBookingStatus', () async {
      when(() => mockRepo.updateBookingStatus('1', BookingStatus.confirmed)).thenAnswer((_) async {});
      await usecase('1', BookingStatus.confirmed);
      verify(() => mockRepo.updateBookingStatus('1', BookingStatus.confirmed)).called(1);
    });

    test('propagates errors from repository', () async {
      when(() => mockRepo.updateBookingStatus('1', BookingStatus.confirmed)).thenThrow(Exception('fail'));
      expect(() => usecase('1', BookingStatus.confirmed), throwsA(isA<Exception>()));
    });
  });
} 