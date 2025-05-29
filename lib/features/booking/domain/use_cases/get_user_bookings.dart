import '../entities/booking.dart';
import '../repositories/booking_repository.dart';

class GetUserBookings {
  final IBookingRepository repository;
  GetUserBookings(this.repository);

  Future<List<Booking>> call(String userId) {
    return repository.getUserBookings(userId);
  }
} 