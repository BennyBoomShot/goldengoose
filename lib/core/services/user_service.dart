// This file has been moved to lib/core/services/user_service.dart
// Please update your imports accordingly.

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:goldengoose/core/logger/app_logger.dart';
import 'package:goldengoose/core/models/user.dart';
import 'package:goldengoose/core/repositories/user_repository.dart';
import 'package:goldengoose/features/auth/data/repositories/auth_repository.dart';

import '../error/app_exception.dart';

class UserService {
  final UserRepository userRepository;
  final AuthRepository authRepository;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserService({required this.userRepository, required this.authRepository});

  /// Registers a new user, creates Firestore profile, and saves FCM token.
  Future<User> registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String? phoneNumber,
  }) async {
    // 1. Create user in Firebase Auth
    final credential = await authRepository.signUp(email: email, password: password);
    final authUser = credential;
    if (authUser == null) {
      AppLogger.error('Failed to create user');
      throw AppException.serverError('Failed to create user');
    }
    // 2. Create user profile in Firestore
    final now = DateTime.now();
    final user = User(
      id: authUser.id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      profileImageUrl: null,
      isVerified: authUser.isEmailVerified,
      createdAt: now,
      updatedAt: now,
    );
    await userRepository.create(user);
    // 3. Save FCM token and listen for refresh
    await saveFcmToken(user.id);
    listenForFcmTokenRefresh(user.id);
    return user;
  }

  /// Signs in a user and saves FCM token.
  Future<User?> signInUser({
    required String email,
    required String password,
  }) async {
    // 1. Sign in with Firebase Auth
    await authRepository.signIn(email: email, password: password);
    // 2. Fetch user profile from Firestore
    final user = await userRepository.getCurrentUserProfile();
    // 3. Save FCM token and listen for refresh
    if (user != null) {
      await saveFcmToken(user.id);
      listenForFcmTokenRefresh(user.id);
    }
    return user;
  }

  /// Saves the FCM token to Firestore for the user.
  Future<void> saveFcmToken(String userId) async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      await _firestore.collection('users').doc(userId).update({
        'fcmToken': fcmToken,
        'fcmTokenUpdatedAt': DateTime.now(),
      });
    }
  }

  /// Listens for FCM token refresh and updates Firestore.
  void listenForFcmTokenRefresh(String userId) {
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      await _firestore.collection('users').doc(userId).update({
        'fcmToken': newToken,
        'fcmTokenUpdatedAt': DateTime.now(),
      });
    });
  }

  /// Signs out the current user.
  Future<void> signOutUser() async {
    await authRepository.signOut();
  }

  /// Fetches the current user's Firestore profile.
  Future<User?> getCurrentUserProfile() async {
    return await userRepository.getCurrentUserProfile();
  }

  /// Updates the user's Firestore profile.
  Future<void> updateUserProfile(User user) async {
    await userRepository.updateUserProfile(user);
  }

  /// Uploads a profile image and updates the user's profile with the image URL.
  Future<void> uploadProfileImage(String userId, Uint8List imageBytes) async {
    await userRepository.uploadProfileImage(userId, imageBytes);
  }

  /// Sends a password reset email to the given email address.
  Future<void> sendPasswordReset(String email) async {
    await authRepository.sendPasswordReset(email);
  }

  /// Sends an email verification to the current user.
  Future<void> sendEmailVerification() async {
    final user = await authRepository.getCurrentUser();
    if (user != null && !user.isEmailVerified) {
      await authRepository.sendEmailVerification();
    }
  }

  /// Checks if the current user's email is verified.
  Future<bool> isEmailVerified() async {
    final user = await authRepository.getCurrentUser();
    if (user != null) {
      await authRepository.isEmailVerified();
      return user.isEmailVerified;
    }
    return false;
  }

  /// Deletes the current user's account from Auth and Firestore.
  Future<void> deleteAccount() async {
    final user = await authRepository.getCurrentUser();
    if (user != null) {
      final uid = user.id;
      await _firestore.collection('users').doc(uid).delete();
      await authRepository.deleteAccount();
    }
  }

  /// Sets the user's role in Firestore (assumes 'role' is a String field).
  Future<void> setUserRole(String userId, String role) async {
    await _firestore.collection('users').doc(userId).update({'role': role});
  }

  /// Re-authenticates the user with email and password (for sensitive actions).
  Future<void> reauthenticateUser(String email, String password) async {
    final user = await authRepository.getCurrentUser();
    if (user != null) {
      await authRepository.reauthenticateUser(email, password);
    }
  }

  /// Lists users, optionally filtered by role or search query (name/email).
  Future<List<User>> listUsers({String? role, String? search}) async {
    Query query = _firestore.collection('users');
    if (role != null) {
      query = query.where('role', isEqualTo: role);
    }
    if (search != null && search.isNotEmpty) {
      // Simple search by name or email (case-insensitive)
      query = query.where('searchKeywords', arrayContains: search.toLowerCase());
    }
    final snapshot = await query.get();
    return snapshot.docs.map((doc) => User.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  /// Blocks or deactivates a user by setting isActive to false.
  Future<void> blockUser(String userId) async {
    await _firestore.collection('users').doc(userId).update({'isActive': false});
  }

  /// Logs a user activity in a user_activity subcollection.
  Future<void> logUserActivity(String userId, String activity) async {
    await _firestore.collection('users').doc(userId).collection('user_activity').add({
      'activity': activity,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  /// Starts phone verification for MFA. Calls onCodeSent with verificationId.
  Future<void> startPhoneVerification(String phoneNumber, Function(String verificationId) onCodeSent) async {
    await authRepository.startPhoneVerification(phoneNumber, onCodeSent);
  }

  /// Verifies the phone code for MFA.
  Future<void> verifyPhoneCode(String verificationId, String smsCode) async {
    await authRepository.verifyPhoneCode(verificationId, smsCode);
  }

  /// Adds a notification to the user's notifications subcollection.
  Future<void> addNotification(String userId, String message) async {
    await _firestore.collection('users').doc(userId).collection('notifications').add({
      'message': message,
      'timestamp': DateTime.now().toIso8601String(),
      'read': false,
    });
  }

  /// Checks if the user's profile is complete (returns missing fields).
  Future<List<String>> checkProfileCompleteness(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    if (!doc.exists) return ['User not found'];
    final data = doc.data() as Map<String, dynamic>;
    final missing = <String>[];
    if ((data['firstName'] ?? '').isEmpty) missing.add('firstName');
    if ((data['lastName'] ?? '').isEmpty) missing.add('lastName');
    if ((data['email'] ?? '').isEmpty) missing.add('email');
    if ((data['profileImageUrl'] ?? '').isEmpty) missing.add('profileImageUrl');
    // Add more fields as needed
    return missing;
  }

  /// Exports all user data for privacy compliance.
  Future<Map<String, dynamic>?> exportUserData(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    if (!doc.exists) return null;
    final data = doc.data() as Map<String, dynamic>;
    // Optionally, fetch subcollections (e.g., activity, notifications)
    final activitySnapshot = await _firestore.collection('users').doc(userId).collection('user_activity').get();
    final notificationsSnapshot = await _firestore.collection('users').doc(userId).collection('notifications').get();
    data['user_activity'] = activitySnapshot.docs.map((d) => d.data()).toList();
    data['notifications'] = notificationsSnapshot.docs.map((d) => d.data()).toList();
    return data;
  }
} 