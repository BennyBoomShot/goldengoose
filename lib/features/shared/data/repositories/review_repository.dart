import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goldengoose/features/shared/models/review.dart';
import 'package:goldengoose/features/shared/data/repositories/notification_repository.dart';
import 'package:goldengoose/features/shared/models/notification.dart';

class ReviewRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final NotificationRepository notificationRepository;

  ReviewRepository({required this.notificationRepository});

  /// Adds a review to the appropriate collection (products/{id}/reviews or businesses/{id}/reviews), and notifies the owner.
  Future<void> addReview(Review review) async {
    final collection = _getTargetCollection(review.targetType, review.targetId);
    await collection.doc(review.id).set(review.toJson());
    // Notify business or product owner
    String ownerId = await _getOwnerIdForTarget(review.targetType, review.targetId);
    final notification = AppNotification(
      id: '${review.id}_${DateTime.now().millisecondsSinceEpoch}',
      userId: ownerId,
      type: NotificationType.reviewRequest,
      title: 'New Review Received',
      message: 'You received a new review: ${review.review}',
      createdAt: DateTime.now(),
    );
    await notificationRepository.addNotification(notification);
  }

  /// Gets all reviews for a target (product or business).
  Future<List<Review>> getReviewsForTarget(String targetId, ReviewTargetType targetType) async {
    final collection = _getTargetCollection(targetType, targetId);
    final snapshot = await collection.get();
    return snapshot.docs.map((doc) => Review.fromJson(doc.data())).toList();
  }

  /// Updates a review.
  Future<void> updateReview(Review review) async {
    final collection = _getTargetCollection(review.targetType, review.targetId);
    await collection.doc(review.id).update(review.toJson());
  }

  /// Deletes a review.
  Future<void> deleteReview(String reviewId, ReviewTargetType targetType, String targetId) async {
    final collection = _getTargetCollection(targetType, targetId);
    await collection.doc(reviewId).delete();
  }

  /// Gets all reviews written by a user (across all products/businesses).
  Future<List<Review>> getUserReviews(String userId) async {
    // This requires a top-level 'reviews' collection for efficient querying.
    final snapshot = await _firestore.collection('reviews').where('userId', isEqualTo: userId).get();
    return snapshot.docs.map((doc) => Review.fromJson(doc.data())).toList();
  }

  /// Helper to get the correct subcollection reference for a review target.
  CollectionReference<Map<String, dynamic>> _getTargetCollection(ReviewTargetType type, String targetId) {
    switch (type) {
      case ReviewTargetType.product:
        return _firestore.collection('products').doc(targetId).collection('reviews');
      case ReviewTargetType.business:
        return _firestore.collection('businesses').doc(targetId).collection('reviews');
    }
  }

  /// Stub: Get the ownerId for a product or business. Replace with real logic.
  Future<String> _getOwnerIdForTarget(ReviewTargetType type, String targetId) async {
    // TODO: Implement logic to fetch ownerId from Firestore
    // For now, return a placeholder
    return 'ownerId_placeholder';
  }
} 