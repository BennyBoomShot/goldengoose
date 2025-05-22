import 'dart:typed_data';
import '../../../../core/error/app_exception.dart';
import '../../../../data/repositories/firebase_repository.dart';
import '../../domain/entities/user.dart';

class UserRepository extends FirebaseRepository<User> {
  UserRepository({
    required super.firebaseDataSource,
  }) : super(
          collection: 'users',
          fromJson: (json) => User.fromJson(json),
          toJson: (user) => user.toJson(),
        );

  Future<User?> getCurrentUserProfile() async {
    final authUser = await getCurrentUser();
    if (authUser == null) return null;
    return get(authUser.uid);
  }

  Future<void> updateUserProfile(User user) async {
    final authUser = await getCurrentUser();
    if (authUser == null) {
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