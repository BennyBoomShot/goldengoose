import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

enum NotificationType {
  orderUpdate,
  promotion,
  reminder,
  reviewRequest,
  account,
  system,
  custom,
}

@freezed
class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String id,
    required String userId,
    required NotificationType type,
    String? category,
    required String title,
    required String message,
    @Default(false) bool read,
    required DateTime createdAt,
    Map<String, dynamic>? data,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) => _$AppNotificationFromJson(json);
} 