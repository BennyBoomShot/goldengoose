import 'package:goldengoose/features/booking/domain/entities/booking.dart' as domain;
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:goldengoose/features/shared/data/repositories/notification_repository.dart';
import 'package:goldengoose/features/shared/models/notification.dart';

class BookingService {
  final firestore.FirebaseFirestore _firestore = firestore.FirebaseFirestore.instance;
  final NotificationRepository notificationRepository;

  BookingService({required this.notificationRepository});

  /// Creates a new booking in Firestore and notifies business and user.
  Future<void> createBooking(domain.Booking booking) async {
    await _firestore.collection('bookings').doc(booking.id).set(booking.toJson());
    // Notify business (stub: booking.businessOwnerId)
    final businessNotification = AppNotification(
      id: '${booking.id}_business_${DateTime.now().millisecondsSinceEpoch}',
      userId: booking.businessOwnerId ?? 'business_owner_placeholder',
      type: NotificationType.orderUpdate,
      title: 'New Booking Received',
      message: 'You have a new booking from ${booking.userName ?? 'a customer'}.',
      createdAt: DateTime.now(),
    );
    await notificationRepository.addNotification(businessNotification);
    // Notify user
    final userNotification = AppNotification(
      id: '${booking.id}_user_${DateTime.now().millisecondsSinceEpoch}',
      userId: booking.userId,
      type: NotificationType.orderUpdate,
      title: 'Booking Created',
      message: 'Your booking has been created and is pending confirmation.',
      createdAt: DateTime.now(),
    );
    await notificationRepository.addNotification(userNotification);
  }

  /// Gets a booking by ID.
  Future<domain.Booking?> getBooking(String bookingId) async {
    final doc = await _firestore.collection('bookings').doc(bookingId).get();
    if (!doc.exists) return null;
    return domain.Booking.fromJson(doc.data() as Map<String, dynamic>);
  }

  /// Updates a booking in Firestore.
  Future<void> updateBooking(domain.Booking booking) async {
    await _firestore.collection('bookings').doc(booking.id).update(booking.toJson());
  }

  /// Deletes a booking from Firestore.
  Future<void> deleteBooking(String bookingId) async {
    await _firestore.collection('bookings').doc(bookingId).delete();
  }

  /// Lists all bookings for a specific user.
  Future<List<domain.Booking>> listBookingsByUser(String userId) async {
    final snapshot = await _firestore.collection('bookings').where('userId', isEqualTo: userId).get();
    return snapshot.docs.map((doc) => domain.Booking.fromJson(doc.data())).toList();
  }

  /// Lists all bookings for a specific business.
  Future<List<domain.Booking>> listBookingsByBusiness(String businessId) async {
    final snapshot = await _firestore.collection('bookings').where('businessId', isEqualTo: businessId).get();
    return snapshot.docs.map((doc) => domain.Booking.fromJson(doc.data())).toList();
  }

  /// Updates the status of a booking and notifies the user.
  Future<void> updateBookingStatus(String bookingId, String status) async {
    await _firestore.collection('bookings').doc(bookingId).update({'status': status});
    final bookingDoc = await _firestore.collection('bookings').doc(bookingId).get();
    final booking = domain.Booking.fromJson(bookingDoc.data() as Map<String, dynamic>);
    final notification = AppNotification(
      id: '${bookingId}_${DateTime.now().millisecondsSinceEpoch}',
      userId: booking.userId,
      type: NotificationType.orderUpdate,
      title: 'Booking Status Updated',
      message: 'Your booking status is now $status.',
      createdAt: DateTime.now(),
    );
    await notificationRepository.addNotification(notification);
  }

  /// Adds an item/service to a booking's items list.
  Future<void> addBookingItem(String bookingId, Map<String, dynamic> item) async {
    await _firestore.collection('bookings').doc(bookingId).update({
      'items': firestore.FieldValue.arrayUnion([item])
    });
  }

  /// Gets booking history for a user (sorted by createdAt desc).
  Future<List<domain.Booking>> getBookingHistory(String userId) async {
    final snapshot = await _firestore
        .collection('bookings')
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .get();
    return snapshot.docs.map((doc) => domain.Booking.fromJson(doc.data())).toList();
  }

  /// Gets booking analytics for a business (total bookings, total revenue).
  Future<Map<String, dynamic>> getBookingAnalytics(String businessId) async {
    final snapshot = await _firestore.collection('bookings').where('businessId', isEqualTo: businessId).get();
    final bookings = snapshot.docs.map((doc) => domain.Booking.fromJson(doc.data())).toList();
    final totalBookings = bookings.length;
    final totalRevenue = bookings.fold<double>(0, (sum, booking) => sum + booking.total);
    return {
      'totalBookings': totalBookings,
      'totalRevenue': totalRevenue,
    };
  }

  /// Adds a notification to a booking's notifications subcollection.
  Future<void> addBookingNotification(String bookingId, String message) async {
    await _firestore.collection('bookings').doc(bookingId).collection('notifications').add({
      'message': message,
      'timestamp': DateTime.now().toIso8601String(),
      'read': false,
    });
  }
} 