import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback.freezed.dart';
part 'feedback.g.dart';

@freezed
class Feedback with _$Feedback {
  const factory Feedback({
    required String id,
    required String userId,
    required String businessId,
    required String serviceId,
    required double rating,
    required String comment,
    List<String>? images,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Feedback;

  factory Feedback.fromJson(Map<String, dynamic> json) => _$FeedbackFromJson(json);
} 