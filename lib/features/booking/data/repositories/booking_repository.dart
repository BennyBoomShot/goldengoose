import '../../../../core/error/app_exception.dart';
import '../../../../data/repositories/firebase_repository.dart';
import '../../domain/entities/booking.dart';
import '../../domain/repositories/booking_repository.dart';

class BookingRepository extends FirebaseRepository<Booking> implements IBookingRepository {
  BookingRepository({
    required super.firebaseDataSource,
  }) : super(
          collection: 'bookings',
          fromJson: (json) => Booking.fromJson(json),
          toJson: (booking) => booking.toJson(),
        );

  @override
  Future<void> createBooking(Booking booking) async {
    await create(booking);
  }

  @override
  Future<Booking?> getBooking(String bookingId) async {
    return get(bookingId);
  }

  @override
  Future<void> updateBooking(Booking booking) async {
    await update(booking);
  }

  @override
  Future<void> deleteBooking(String bookingId) async {
    await delete(bookingId);
  }

  @override
  Future<List<Booking>> getUserBookings(String userId) async {
    try {
      final querySnapshot = await firebaseDataSource.firestore
          .collection(collection)
          .where('userId', isEqualTo: userId)
          .orderBy('startTime', descending: true)
          .get();
      return querySnapshot.docs
          .map((doc) => fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw AppException.unknown('Failed to get user bookings: $e');
    }
  }

  @override
  Future<List<Booking>> getBusinessBookings(String businessId) async {
    try {
      final querySnapshot = await firebaseDataSource.firestore
          .collection(collection)
          .where('businessId', isEqualTo: businessId)
          .orderBy('startTime', descending: true)
          .get();
      return querySnapshot.docs
          .map((doc) => fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw AppException.unknown('Failed to get business bookings: $e');
    }
  }

  @override
  Future<List<Booking>> getUpcomingBookings(String userId) async {
    try {
      final now = DateTime.now();
      final querySnapshot = await firebaseDataSource.firestore
          .collection(collection)
          .where('userId', isEqualTo: userId)
          .where('startTime', isGreaterThan: now)
          .orderBy('startTime')
          .get();
      return querySnapshot.docs
          .map((doc) => fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw AppException.unknown('Failed to get upcoming bookings: $e');
    }
  }

  @override
  Future<void> updateBookingStatus(String bookingId, BookingStatus status) async {
    try {
      final booking = await get(bookingId);
      if (booking == null) {
        throw AppException.notFound('Booking not found');
      }

      final updatedBooking = Booking(
        id: booking.id,
        userId: booking.userId,
        businessId: booking.businessId,
        serviceId: booking.serviceId,
        startTime: booking.startTime,
        endTime: booking.endTime,
        total: booking.total,
        businessOwnerId: booking.businessOwnerId,
        userName: booking.userName,
        serviceName: booking.serviceName,
        notes: booking.notes,
        status: status,
        createdAt: booking.createdAt,
        updatedAt: DateTime.now(),
      );

      await update(updatedBooking);
    } catch (e) {
      throw AppException.unknown('Failed to update booking status: $e');
    }
  }

  @override
  Future<List<Booking>> getBookingsByDateRange(
    String businessId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      final querySnapshot = await firebaseDataSource.firestore
          .collection(collection)
          .where('businessId', isEqualTo: businessId)
          .where('startTime', isGreaterThanOrEqualTo: startDate)
          .where('startTime', isLessThanOrEqualTo: endDate)
          .orderBy('startTime')
          .get();
      return querySnapshot.docs
          .map((doc) => fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw AppException.unknown('Failed to get bookings by date range: $e');
    }
  }
} 