import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../../core/error/app_exception.dart';
import '../../../../core/logger/app_logger.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final auth.FirebaseAuth _auth;

  AuthRepository({auth.FirebaseAuth? authInstance})
      : _auth = authInstance ?? auth.FirebaseAuth.instance;

  /// Stream of auth state changes (login/logout).
  Stream<auth.User?> authStateChanges() => _auth.authStateChanges();

  @override
  Future<AuthUser?> getCurrentUser() async {
    final user = _auth.currentUser;
    return user?.toDomain();
  }

  @override
  Future<AuthUser?> signIn({required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user?.toDomain();
    } on auth.FirebaseAuthException catch (e) {
      AppLogger.error('Auth error', e, StackTrace.current);
      throw AppException.unauthorized(e.message ?? 'Authentication failed');
    }
  }

  @override
  Future<AuthUser?> signUp({required String email, required String password, String? displayName}) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (displayName != null && credential.user != null) {
        await credential.user!.updateDisplayName(displayName);
      }
      return credential.user?.toDomain();
    } on auth.FirebaseAuthException catch (e) {
      AppLogger.error('Auth error', e, StackTrace.current);
      throw AppException.unauthorized(e.message ?? 'User creation failed');
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<void> sendPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on auth.FirebaseAuthException catch (e) {
      AppLogger.error('Auth error', e, StackTrace.current);
      throw AppException.unauthorized(e.message ?? 'Password reset failed');
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  @override
  Future<bool> isEmailVerified() async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.reload();
      return user.emailVerified;
    }
    return false;
  }

  @override
  Future<void> reauthenticateUser(String email, String password) async {
    final user = _auth.currentUser;
    if (user != null) {
      final credential =
          auth.EmailAuthProvider.credential(email: email, password: password);
      await user.reauthenticateWithCredential(credential);
    }
  }

  @override
  Future<void> deleteAccount() async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.delete();
    }
  }

  @override
  Future<void> startPhoneVerification(String phoneNumber, Function(String verificationId) onCodeSent) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (auth.AuthCredential credential) {},
      verificationFailed: (auth.FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Future<void> verifyPhoneCode(String verificationId, String smsCode) async {
    final credential = auth.PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    await _auth.currentUser?.linkWithCredential(credential);
  }
}
