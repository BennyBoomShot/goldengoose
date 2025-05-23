import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

enum ReviewTargetType { product, business }

@freezed
class Review with _$Review {
  const factory Review({
    required String id,
    required String userId,
    required String targetId,
    required ReviewTargetType targetType,
    required int rating,
    required String review,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
} 