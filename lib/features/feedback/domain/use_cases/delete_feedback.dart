import '../../data/repositories/feedback_service.dart';

class DeleteFeedback {
  final FeedbackService service;
  DeleteFeedback(this.service);

  Future<void> call(String feedbackId) async {
    await service.deleteFeedback(feedbackId);
  }
} 