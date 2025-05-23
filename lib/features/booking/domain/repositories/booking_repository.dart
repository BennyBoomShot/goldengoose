import '../entities/booking.dart';

abstract class IBookingRepository {
  Future<void> createBooking(Booking booking);
  Future<Booking?> getBooking(String bookingId);
  Future<void> updateBooking(Booking booking);
  Future<void> deleteBooking(String bookingId);
  Future<List<Booking>> getUserBookings(String userId);
  Future<List<Booking>> getBusinessBookings(String businessId);
  Future<List<Booking>> getUpcomingBookings(String userId);
  Future<void> updateBookingStatus(String bookingId, BookingStatus status);
  Future<List<Booking>> getBookingsByDateRange(String businessId, DateTime startDate, DateTime endDate);
} 