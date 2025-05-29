import '../entities/booking.dart';
import '../repositories/booking_repository.dart';

class UpdateBookingStatus {
  final IBookingRepository repository;
  UpdateBookingStatus(this.repository);

  Future<void> call(String bookingId, BookingStatus status) {
    return repository.updateBookingStatus(bookingId, status);
  }
} 