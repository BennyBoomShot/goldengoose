import '../entities/booking.dart';
import '../repositories/booking_repository.dart';

class CreateBooking {
  final IBookingRepository repository;
  CreateBooking(this.repository);

  Future<void> call(Booking booking) {
    return repository.createBooking(booking);
  }
} 