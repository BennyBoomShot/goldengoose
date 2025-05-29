import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../../core/repositories/user_repository.dart';
import '../../domain/entities/auth_user.dart';
import 'auth_repository.dart';

class AuthService {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  AuthService({required this.authRepository, required this.userRepository});

  Future<AuthUser?> signIn({required String email, required String password}) async {
    return await authRepository.signIn(email: email, password: password);
  }

  /// Stream of auth state changes (login/logout).
  Stream<auth.User?> authStateChanges() => authRepository.authStateChanges();

  /// Re-authenticates the user with email and password (for sensitive actions).
  Future<void> reauthenticateUser(String email, String password) async {
    await authRepository.reauthenticateUser(email, password);
  }

  /// Starts phone verification for MFA. Calls onCodeSent with verificationId.
  Future<void> startPhoneVerification(String phoneNumber, Function(String verificationId) onCodeSent) async {
    await authRepository.startPhoneVerification(phoneNumber, onCodeSent);
  }

  /// Verifies the phone code for MFA.
  Future<void> verifyPhoneCode(String verificationId, String smsCode) async {
    await authRepository.verifyPhoneCode(verificationId, smsCode);
  }

  /// Sends a password reset email to the given email address.
  Future<void> sendPasswordReset(String email) async {
    await authRepository.sendPasswordReset(email);
  }

  /// Sends an email verification to the current user.
  Future<void> sendEmailVerification() async {
    await authRepository.sendEmailVerification();
  }

  /// Checks if the current user's email is verified.
  Future<bool> isEmailVerified() async {
    return await authRepository.isEmailVerified();
  }

  /// Deletes the current user's account from Auth and Firestore.
  Future<void> deleteAccount() async {
    final user = await authRepository.getCurrentUser();
    if (user != null) {
      final uid = user.id;
      // Delete Firestore data first, then auth account
      await userRepository.delete(uid);
      await authRepository.deleteAccount();
    }
  }
}