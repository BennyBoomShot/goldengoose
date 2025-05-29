// This file has been moved to lib/core/repositories/user_repository.dart
// Please update your imports accordingly.

import 'dart:typed_data';

import 'package:goldengoose/core/logger/app_logger.dart';
import 'package:goldengoose/core/models/user.dart';
import 'package:goldengoose/features/auth/data/repositories/auth_repository.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../data/repositories/firebase_repository.dart';

class UserRepository extends FirebaseRepository<User> {
  UserRepository({
    required super.firebaseDataSource,
  }) : super(
          collection: 'users',
          fromJson: (json) => User.fromJson(json),
          toJson: (user) => user.toJson(),
        );

  Future<User?> getCurrentUserProfile() async {
    final authUser = await AuthRepository().getCurrentUser();
    if (authUser == null) return null;
    return get(authUser.id);
  }

  Future<void> updateUserProfile(User user) async {
    final authUser = await AuthRepository().getCurrentUser();
    if (authUser == null) {
      AppLogger.error('User not authenticated');
      throw AppException.unauthorized('User not authenticated');
    }
    await update(user);
  }

  Future<void> uploadProfileImage(String userId, Uint8List imageBytes) async {
    final path = 'users/$userId/profile_image';
    final imageUrl = await uploadFile(path, imageBytes);
    
    final user = await get(userId);
    if (user != null) {
      final updatedUser = User(
        id: user.id,
        email: user.email,
        firstName: user.firstName,
        lastName: user.lastName,
        phoneNumber: user.phoneNumber,
        profileImageUrl: imageUrl,
        isVerified: user.isVerified,
        createdAt: user.createdAt,
        updatedAt: DateTime.now(),
      );
      await update(updatedUser);
    }
  }
} 