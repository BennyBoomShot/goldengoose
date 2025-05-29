import '../entities/feedback.dart';
import '../../data/repositories/feedback_service.dart';

class AddFeedback {
  final FeedbackService service;
  AddFeedback(this.service);

  Future<void> call(Feedback feedback) async {
    await service.addFeedback(feedback);
  }
} 