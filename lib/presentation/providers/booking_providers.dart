import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goldengoose/data/datasources/remote/firebase/firebase_data_source.dart';
import 'package:goldengoose/features/booking/data/repositories/booking_repository.dart';
import 'package:goldengoose/features/booking/domain/usecases/create_booking.dart';
import 'package:goldengoose/features/booking/domain/usecases/get_booking.dart';
import 'package:goldengoose/features/booking/domain/usecases/get_user_bookings.dart';
import 'package:goldengoose/features/booking/domain/usecases/get_business_bookings.dart';
import 'package:goldengoose/features/booking/domain/usecases/get_upcoming_bookings.dart';
import 'package:goldengoose/features/booking/domain/usecases/get_bookings_by_date_range.dart';
import 'package:goldengoose/features/booking/domain/usecases/update_booking.dart';
import 'package:goldengoose/features/booking/domain/usecases/delete_booking.dart';
import 'package:goldengoose/features/booking/domain/usecases/update_booking_status.dart';

final firebaseDataSourceProvider = Provider<FirebaseDataSource>((ref) => FirebaseDataSource());

final bookingRepositoryProvider = Provider<BookingRepository>((ref) {
  final firebaseDataSource = ref.read(firebaseDataSourceProvider);
  return BookingRepository(firebaseDataSource: firebaseDataSource);
});

final createBookingProvider = Provider<CreateBooking>((ref) {
  final repo = ref.read(bookingRepositoryProvider);
  return CreateBooking(repo);
});

final getBookingProvider = Provider<GetBooking>((ref) {
  final repo = ref.read(bookingRepositoryProvider);
  return GetBooking(repo);
});

final getUserBookingsProvider = Provider<GetUserBookings>((ref) {
  final repo = ref.read(bookingRepositoryProvider);
  return GetUserBookings(repo);
});

final getBusinessBookingsProvider = Provider<GetBusinessBookings>((ref) {
  final repo = ref.read(bookingRepositoryProvider);
  return GetBusinessBookings(repo);
});

final getUpcomingBookingsProvider = Provider<GetUpcomingBookings>((ref) {
  final repo = ref.read(bookingRepositoryProvider);
  return GetUpcomingBookings(repo);
});

final getBookingsByDateRangeProvider = Provider<GetBookingsByDateRange>((ref) {
  final repo = ref.read(bookingRepositoryProvider);
  return GetBookingsByDateRange(repo);
});

final updateBookingProvider = Provider<UpdateBooking>((ref) {
  final repo = ref.read(bookingRepositoryProvider);
  return UpdateBooking(repo);
});

final deleteBookingProvider = Provider<DeleteBooking>((ref) {
  final repo = ref.read(bookingRepositoryProvider);
  return DeleteBooking(repo);
});

final updateBookingStatusProvider = Provider<UpdateBookingStatus>((ref) {
  final repo = ref.read(bookingRepositoryProvider);
  return UpdateBookingStatus(repo);
}); 