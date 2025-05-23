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
      total: (json['total'] as num).toDouble(),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      paymentIntentId: json['paymentIntentId'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      deliveryInfo: json['deliveryInfo'] as Map<String, dynamic>?,
      customerContact: json['customerContact'] as String?,
      discount: (json['discount'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'businessId': instance.businessId,
      'items': instance.items,
      'total': instance.total,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'paymentIntentId': instance.paymentIntentId,
      'paymentStatus': instance.paymentStatus,
      'deliveryInfo': instance.deliveryInfo,
      'customerContact': instance.customerContact,
      'discount': instance.discount,
      'tax': instance.tax,
      'notes': instance.notes,
      'isDeleted': instance.isDeleted,
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
