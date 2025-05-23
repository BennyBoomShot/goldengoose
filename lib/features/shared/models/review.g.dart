// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      targetId: json['targetId'] as String,
      targetType: $enumDecode(_$ReviewTargetTypeEnumMap, json['targetType']),
      rating: (json['rating'] as num).toInt(),
      review: json['review'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'targetId': instance.targetId,
      'targetType': _$ReviewTargetTypeEnumMap[instance.targetType]!,
      'rating': instance.rating,
      'review': instance.review,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$ReviewTargetTypeEnumMap = {
  ReviewTargetType.product: 'product',
  ReviewTargetType.business: 'business',
};
