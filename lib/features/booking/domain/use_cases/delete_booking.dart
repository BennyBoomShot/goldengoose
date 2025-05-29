import '../repositories/booking_repository.dart';

class DeleteBooking {
  final IBookingRepository repository;
  DeleteBooking(this.repository);

  Future<void> call(String bookingId) {
    return repository.deleteBooking(bookingId);
  }
} 