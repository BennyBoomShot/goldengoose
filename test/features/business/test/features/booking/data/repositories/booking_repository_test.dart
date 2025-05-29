import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/core/error/app_exception.dart';
import 'package:goldengoose/data/datasources/remote/firebase/firebase_data_source.dart';
import 'package:goldengoose/features/booking/data/repositories/booking_repository.dart';
import 'package:goldengoose/features/booking/domain/entities/booking.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseDataSource extends Mock implements FirebaseDataSource {}

void main() {
  late BookingRepository repository;
  late MockFirebaseDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockFirebaseDataSource();
    repository = BookingRepository(firebaseDataSource: mockDataSource);
  });

  group('BookingRepository', () {
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

    test('should throw AppException.unknown on get error', () async {
      when(() => mockDataSource.firestore.collection(any()).doc(any()).get()).thenThrow(Exception('fail'));
      expect(() => repository.getBooking('bad_id'), throwsA(isA<AppException>()));
    });

    test('should throw AppException.unknown on create error', () async {
      when(() => mockDataSource.firestore.collection(any()).doc(any()).get()).thenThrow(Exception('fail'));
      expect(() => repository.createBooking(booking), throwsA(isA<AppException>()));
    });

    test('should throw AppException.unknown on update error', () async {
      when(() => mockDataSource.firestore.collection(any()).doc(any()).get()).thenThrow(Exception('fail'));
      expect(() => repository.updateBooking(booking), throwsA(isA<AppException>()));
    });

    test('should throw AppException.unknown on delete error', () async {
      when(() => mockDataSource.firestore.collection(any()).doc(any()).get()).thenThrow(Exception('fail'));
      expect(() => repository.deleteBooking('bad_id'), throwsA(isA<AppException>()));
    });
  });
} 