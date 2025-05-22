import 'package:goldengoose/core/logger/app_logger.dart';
import 'package:goldengoose/data/datasources/remote/firebase/firebase_data_source.dart';
import 'package:goldengoose/data/repositories/firebase_repository.dart';
import 'package:goldengoose/features/feedback/domain/entities/feedback.dart';
import 'package:goldengoose/core/error/app_exception.dart';

class FeedbackRepository extends FirebaseRepository<Feedback> {
  FeedbackRepository({
    required FirebaseDataSource firebaseDataSource,
  }) : super(
          firebaseDataSource: firebaseDataSource,
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
} 