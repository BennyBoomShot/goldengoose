import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goldengoose/features/service/domain/entities/service.dart';

part 'order.freezed.dart';
part 'order.g.dart';

enum OrderStatus {
  pending,
  confirmed,
  inProgress,
  completed,
  cancelled,
  refunded
}

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String userId,
    required String businessId,
    required List<OrderItem> items,
    required double total,
    required OrderStatus status,
    String? paymentIntentId,
    String? paymentStatus,
    Map<String, dynamic>? deliveryInfo,
    String? customerContact,
    double? discount,
    double? tax,
    String? notes,
    @Default(false) bool isDeleted,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String id,
    @JsonKey(fromJson: _serviceFromJson, toJson: _serviceToJson) required Service service,
    required DateTime scheduledTime,
    required int quantity,
    required double price,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);
}

Service _serviceFromJson(Map<String, dynamic> json) => Service.fromJson(json);
Map<String, dynamic> _serviceToJson(Service service) => service.toJson(); 