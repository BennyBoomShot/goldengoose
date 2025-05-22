import 'package:freezed_annotation/freezed_annotation.dart';

part 'business.freezed.dart';
part 'business.g.dart';

@freezed
class Business with _$Business {
  const factory Business({
    required String id,
    required String name,
    required String description,
    required String address,
    required String city,
    required String state,
    required String zipCode,
    required String country,
    String? website,
    String? phoneNumber,
    String? email,
    List<String>? images,
    double? rating,
    int? reviewCount,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Business;

  factory Business.fromJson(Map<String, dynamic> json) => _$BusinessFromJson(json);
} 