import '../entities/booking.dart';
import '../repositories/booking_repository.dart';

class UpdateBooking {
  final IBookingRepository repository;
  UpdateBooking(this.repository);

  Future<void> call(Booking booking) {
    return repository.updateBooking(booking);
  }
} 