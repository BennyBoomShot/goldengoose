import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/features/booking/domain/entities/booking.dart';

void main() {
  group('Booking Entity', () {
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

    test('should serialize/deserialize correctly', () {
      final json = booking.toJson();
      final fromJson = Booking.fromJson(json);
      expect(fromJson, booking);
    });

    test('should support copyWith', () {
      final updated = booking.copyWith(total: 200.0);
      expect(updated.total, 200.0);
      expect(updated.id, booking.id);
    });

    test('should support equality', () {
      final booking2 = booking.copyWith();
      expect(booking, booking2);
    });

    test('should use default status', () {
      final b = Booking(
        id: '2',
        userId: 'u2',
        businessId: 'b2',
        serviceId: 's2',
        startTime: now,
        endTime: now.add(Duration(hours: 1)),
        total: 50.0,
        createdAt: now,
        updatedAt: now,
      );
      expect(b.status, BookingStatus.pending);
    });
  });
} 