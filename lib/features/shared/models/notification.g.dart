// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppNotificationImpl _$$AppNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$AppNotificationImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      category: json['category'] as String?,
      title: json['title'] as String,
      message: json['message'] as String,
      read: json['read'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AppNotificationImplToJson(
        _$AppNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'category': instance.category,
      'title': instance.title,
      'message': instance.message,
      'read': instance.read,
      'createdAt': instance.createdAt.toIso8601String(),
      'data': instance.data,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.orderUpdate: 'orderUpdate',
  NotificationType.promotion: 'promotion',
  NotificationType.reminder: 'reminder',
  NotificationType.reviewRequest: 'reviewRequest',
  NotificationType.account: 'account',
  NotificationType.system: 'system',
  NotificationType.custom: 'custom',
};
