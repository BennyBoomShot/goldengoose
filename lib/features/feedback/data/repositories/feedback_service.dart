import '../../../../core/logger/app_logger.dart';
import '../../domain/entities/feedback.dart';
import 'feedback_repository.dart';

class FeedbackService {
  final FeedbackRepository feedbackRepository;

  FeedbackService({required this.feedbackRepository});

  Future<void> addFeedback(Feedback feedback) async {
    await feedbackRepository.addFeedback(feedback);
    String message = feedback.comment;
    await Future.wait([
      _sendPushNotification('New feedback received', message),
      _sendEmailNotification('New feedback received', message),
    ]);
  }

  Future<List<Feedback>> getFeedback(String businessId) async {
    return await feedbackRepository.getFeedback(businessId);
  }

  Future<void> deleteFeedback(String feedbackId) async {
    await feedbackRepository.deleteFeedback(feedbackId);
    const String notificationTitle = 'Feedback deleted';
    const String notificationMessage = 'A feedback entry was deleted.';
    await Future.wait([
      _sendPushNotification(notificationTitle, notificationMessage),
      _sendEmailNotification(notificationTitle, notificationMessage),
    ]);
  }

  Future<void> _sendPushNotification(String title, String message) async {
    AppLogger.info('Push notification: $title - $message');
  }

  Future<void> _sendEmailNotification(String subject, String body) async {
    AppLogger.info('Email notification: $subject - $body');
  }
}