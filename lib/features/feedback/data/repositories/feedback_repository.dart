import '../../../../core/error/app_exception.dart';
import '../../../../core/logger/app_logger.dart';
import '../../../../data/repositories/firebase_repository.dart';
import '../../domain/entities/feedback.dart';

class FeedbackRepository extends FirebaseRepository<Feedback> {
  FeedbackRepository({
    required super.firebaseDataSource,
  }) : super(
          collection: 'feedbacks',
          fromJson: (json) => Feedback.fromJson(json),
          toJson: (feedback) => feedback.toJson(),
        );

  @override
  Future<Feedback?> get(String id) async {
    try {
      return await super.get(id);
    } catch (e, st) {
      AppLogger.error('FeedbackRepository.get error', e, st);
      throw AppException.unknown('Failed to get feedback: $e');
    }
  }

  @override
  Future<List<Feedback>> getAll() async {
    try {
      return await super.getAll();
    } catch (e, st) {
      AppLogger.error('FeedbackRepository.getAll error', e, st);
      throw AppException.unknown('Failed to get feedbacks: $e');
    }
  }

  @override
  Future<void> create(Feedback item) async {
    try {
      await super.create(item);
    } catch (e, st) {
      AppLogger.error('FeedbackRepository.create error', e, st);
      throw AppException.unknown('Failed to create feedback: $e');
    }
  }

  @override
  Future<void> update(Feedback item) async {
    try {
      await super.update(item);
    } catch (e, st) {
      AppLogger.error('FeedbackRepository.update error', e, st);
      throw AppException.unknown('Failed to update feedback: $e');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await super.delete(id);
    } catch (e, st) {
      AppLogger.error('FeedbackRepository.delete error', e, st);
      throw AppException.unknown('Failed to delete feedback: $e');
    }
  }

  // Custom method to add feedback
  Future<void> addFeedback(Feedback feedback) async {
    await create(feedback);
  }

  // Custom method to get feedback by businessId
  Future<List<Feedback>> getFeedback(String businessId) async {
    try {
      final allFeedback = await getAll();
      return allFeedback.where((f) => f.businessId == businessId).toList();
    } catch (e, st) {
      AppLogger.error('FeedbackRepository.getFeedback error', e, st);
      throw AppException.unknown('Failed to get feedback for business: $e');
    }
  }

  // Custom method to delete feedback by id
  Future<void> deleteFeedback(String feedbackId) async {
    await delete(feedbackId);
  }
} 