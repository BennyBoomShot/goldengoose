// lib/features/auth/domain/models/app_user.dart
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

@freezed
class AuthUser with _$AuthUser {
  const factory AuthUser({
    required String id,
    required String email,
    String? displayName,
    required bool isEmailVerified,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, dynamic> json) => _$AuthUserFromJson(json);
}

extension AuthUserMapper on auth.User {
  AuthUser toDomain() => AuthUser(
    id: uid,
    email: email ?? '',
    displayName: displayName,
    isEmailVerified: emailVerified,
  );
}