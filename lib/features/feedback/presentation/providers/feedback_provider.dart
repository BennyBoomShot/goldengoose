import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goldengoose/presentation/providers/booking_providers.dart'
    show firebaseDataSourceProvider;

import '../../data/repositories/feedback_repository.dart';
import '../../data/repositories/feedback_service.dart';
import '../../domain/entities/feedback.dart';
import '../../domain/use_cases/add_feedback.dart';
import '../../domain/use_cases/delete_feedback.dart';
import '../../domain/use_cases/get_feedback.dart';

final feedbackRepositoryProvider = Provider<FeedbackRepository>((ref) {
  final firebaseDataSource = ref.watch(firebaseDataSourceProvider);
  return FeedbackRepository(firebaseDataSource: firebaseDataSource);
});

final feedbackServiceProvider = Provider<FeedbackService>((ref) {
  final repo = ref.watch(feedbackRepositoryProvider);
  return FeedbackService(feedbackRepository: repo);
});

final addFeedbackProvider = Provider<AddFeedback>((ref) {
  final service = ref.watch(feedbackServiceProvider);
  return AddFeedback(service);
});

final getFeedbackProvider = Provider<GetFeedback>((ref) {
  final service = ref.watch(feedbackServiceProvider);
  return GetFeedback(service);
});

final deleteFeedbackProvider = Provider<DeleteFeedback>((ref) {
  final service = ref.watch(feedbackServiceProvider);
  return DeleteFeedback(service);
});

final feedbackListProvider =
    FutureProvider.family<List<Feedback>, String>((ref, businessId) async {
  final getFeedback = ref.watch(getFeedbackProvider);
  return await getFeedback(businessId);
});

class FeedbackNotifier extends StateNotifier<AsyncValue<List<Feedback>>> {
  FeedbackNotifier(this._getFeedback) : super(const AsyncLoading());

  final GetFeedback _getFeedback;

  Future<void> load(String businessId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _getFeedback(businessId));
  }
}

final feedbackNotifierProvider = StateNotifierProvider.autoDispose
    .family<FeedbackNotifier, AsyncValue<List<Feedback>>, String>(
        (ref, businessId) {
  final getFeedback = ref.watch(getFeedbackProvider);
  final notifier = FeedbackNotifier(getFeedback);
  notifier.load(businessId);
  return notifier;
});
