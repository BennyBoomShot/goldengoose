import '../entities/auth_user.dart';

abstract class IAuthRepository {
  Future<AuthUser?> signIn({required String email, required String password});
  Future<AuthUser?> signUp({required String email, required String password, String? displayName});
  Future<void> signOut();
  Future<AuthUser?> getCurrentUser();
  Future<void> sendPasswordReset(String email);
  Future<void> sendEmailVerification();
  Future<bool> isEmailVerified();
  Future<void> reauthenticateUser(String email, String password);
  Future<void> deleteAccount();
  Future<void> startPhoneVerification(String phoneNumber, Function(String verificationId) onCodeSent);
  Future<void> verifyPhoneCode(String verificationId, String smsCode);
}