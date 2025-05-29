import '../../data/repositories/feedback_service.dart';
import '../entities/feedback.dart';

class GetFeedback {
  final FeedbackService service;
  GetFeedback(this.service);

  Future<List<Feedback>> call(String businessId) async {
    return await service.getFeedback(businessId);
  }
} 