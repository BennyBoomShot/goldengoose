import '../entities/booking.dart';
import '../repositories/booking_repository.dart';

class GetBusinessBookings {
  final IBookingRepository repository;
  GetBusinessBookings(this.repository);

  Future<List<Booking>> call(String businessId) {
    return repository.getBusinessBookings(businessId);
  }
} 