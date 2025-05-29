import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/data/repositories/auth_service.dart';
import '../../features/auth/domain/use_cases/delete_account.dart';
import '../../features/auth/domain/use_cases/get_current_user.dart';
import '../../features/auth/domain/use_cases/is_email_verified.dart';
import '../../features/auth/domain/use_cases/reauthenticate_user.dart';
import '../../features/auth/domain/use_cases/send_email_verification.dart';
import '../../features/auth/domain/use_cases/sign_in.dart';
import '../../features/auth/domain/use_cases/sign_out.dart';
import '../../features/auth/domain/use_cases/sign_up.dart';
import '../../features/auth/domain/use_cases/start_phone_verification.dart';
import '../../features/auth/domain/use_cases/verify_phone_code.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final userRepository = ref.read(userRepositoryProvider);
  final authRepository = ref.read(authRepositoryProvider);
  return AuthService(userRepository: userRepository, authRepository: authRepository);
});

final signInProvider = Provider<SignIn>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return SignIn(repo);
});

final signUpProvider = Provider<SignUp>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return SignUp(repo);
});

final signOutProvider = Provider<SignOut>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return SignOut(repo);
});

final getCurrentUserProvider = Provider<GetCurrentUser>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return GetCurrentUser(repo);
});

final sendEmailVerificationProvider = Provider<SendEmailVerification>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return SendEmailVerification(repo);
});

final isEmailVerifiedProvider = Provider<IsEmailVerified>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return IsEmailVerified(repo);
});

final reauthenticateUserProvider = Provider<ReauthenticateUser>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return ReauthenticateUser(repo);
});

final deleteAccountProvider = Provider<DeleteAccount>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return DeleteAccount(repo);
});

final startPhoneVerificationProvider = Provider<StartPhoneVerification>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return StartPhoneVerification(repo);
});

final verifyPhoneCodeProvider = Provider<VerifyPhoneCode>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return VerifyPhoneCode(repo);
}); 