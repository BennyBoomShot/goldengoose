import '../entities/booking.dart';
import '../repositories/booking_repository.dart';

class GetBooking {
  final IBookingRepository repository;
  GetBooking(this.repository);

  Future<Booking?> call(String bookingId) {
    return repository.getBooking(bookingId);
  }
} 