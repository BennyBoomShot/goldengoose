import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goldengoose/features/service/domain/entities/service.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  const factory Cart({
    required String id,
    required String userId,
    required List<CartItem> items,
    required double totalAmount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required String id,
    @JsonKey(fromJson: _serviceFromJson, toJson: _serviceToJson) required Service service,
    required DateTime scheduledTime,
    required int quantity,
    required double price,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
}

Service _serviceFromJson(Map<String, dynamic> json) => Service.fromJson(json);
Map<String, dynamic> _serviceToJson(Service service) => service.toJson(); 