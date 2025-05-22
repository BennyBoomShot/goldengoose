// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      businessId: json['businessId'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      paymentIntentId: json['paymentIntentId'] as String?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'businessId': instance.businessId,
      'items': instance.items,
      'totalAmount': instance.totalAmount,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'paymentIntentId': instance.paymentIntentId,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.confirmed: 'confirmed',
  OrderStatus.inProgress: 'inProgress',
  OrderStatus.completed: 'completed',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.refunded: 'refunded',
};

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      id: json['id'] as String,
      service: _serviceFromJson(json['service'] as Map<String, dynamic>),
      scheduledTime: DateTime.parse(json['scheduledTime'] as String),
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service': _serviceToJson(instance.service),
      'scheduledTime': instance.scheduledTime.toIso8601String(),
      'quantity': instance.quantity,
      'price': instance.price,
    };
