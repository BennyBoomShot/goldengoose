import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

enum BookingStatus {
  pending,
  confirmed,
  cancelled,
  completed,
  noShow
}

@freezed
class Booking with _$Booking {
  const factory Booking({
    required String id,
    required String userId,
    required String businessId,
    required String serviceId,
    required DateTime startTime,
    required DateTime endTime,
    required double totalAmount,
    String? notes,
    @Default(BookingStatus.pending) BookingStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
} 