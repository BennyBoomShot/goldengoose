import '../entities/booking.dart';
import '../repositories/booking_repository.dart';

class GetUpcomingBookings {
  final IBookingRepository repository;
  GetUpcomingBookings(this.repository);

  Future<List<Booking>> call(String userId) {
    return repository.getUpcomingBookings(userId);
  }
} 