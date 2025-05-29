import '../entities/booking.dart';
import '../repositories/booking_repository.dart';

class GetBookingsByDateRange {
  final IBookingRepository repository;
  GetBookingsByDateRange(this.repository);

  Future<List<Booking>> call(String businessId, DateTime startDate, DateTime endDate) {
    return repository.getBookingsByDateRange(businessId, startDate, endDate);
  }
} 