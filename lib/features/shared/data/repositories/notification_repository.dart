import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goldengoose/features/shared/models/notification.dart';

class NotificationRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Adds a notification to the user's notifications subcollection.
  Future<void> addNotification(AppNotification notification) async {
    await _firestore
        .collection('users')
        .doc(notification.userId)
        .collection('notifications')
        .doc(notification.id)
        .set(notification.toJson());
  }

  /// Gets all notifications for a user, sorted by createdAt descending.
  Future<List<AppNotification>> getUserNotifications(String userId) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .orderBy('createdAt', descending: true)
        .get();
    return snapshot.docs.map((doc) => AppNotification.fromJson(doc.data())).toList();
  }

  /// Gets notifications for a user filtered by type.
  Future<List<AppNotification>> getUserNotificationsByType(String userId, NotificationType type) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .where('type', isEqualTo: type.name)
        .orderBy('createdAt', descending: true)
        .get();
    return snapshot.docs.map((doc) => AppNotification.fromJson(doc.data())).toList();
  }

  /// Gets notifications for a user filtered by category.
  Future<List<AppNotification>> getUserNotificationsByCategory(String userId, String category) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .where('category', isEqualTo: category)
        .orderBy('createdAt', descending: true)
        .get();
    return snapshot.docs.map((doc) => AppNotification.fromJson(doc.data())).toList();
  }

  /// Marks a notification as read.
  Future<void> markAsRead(String userId, String notificationId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .doc(notificationId)
        .update({'read': true});
  }

  /// Deletes a notification.
  Future<void> deleteNotification(String userId, String notificationId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .doc(notificationId)
        .delete();
  }
} 