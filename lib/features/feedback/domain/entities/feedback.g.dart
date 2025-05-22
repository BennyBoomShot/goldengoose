// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackImpl _$$FeedbackImplFromJson(Map<String, dynamic> json) =>
    _$FeedbackImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      businessId: json['businessId'] as String,
      serviceId: json['serviceId'] as String,
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$FeedbackImplToJson(_$FeedbackImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'businessId': instance.businessId,
      'serviceId': instance.serviceId,
      'rating': instance.rating,
      'comment': instance.comment,
      'images': instance.images,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
