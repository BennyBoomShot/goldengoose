import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../core/logger/app_logger.dart';
import '../../../../core/repositories/user_repository.dart';
import '../../../../core/services/user_service.dart';
import '../../../../data/datasources/remote/firebase/firebase_data_source.dart';
import '../../../../shared/models/async_state.dart';
import '../../../shared/data/repositories/notification_repository.dart';
import '../../../shared/models/notification.dart';
import '../../data/repositories/auth_repository.dart';
import '../../domain/domain.dart';
import '../../domain/entities/auth_user.dart';

final firebaseDataSourceProvider = Provider<FirebaseDataSource>((ref) {
  final dataSource = FirebaseDataSource();
  dataSource.initialize(); // Make sure to await this in real apps!
  return dataSource;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepository();
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final firebaseDataSource = ref.watch(firebaseDataSourceProvider);
  return UserRepository(firebaseDataSource: firebaseDataSource);
});

final userServiceProvider = Provider<UserService>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return UserService(
    userRepository: userRepository,
    authRepository: authRepository,
  );
});

final signInProvider = Provider<SignIn>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return SignIn(repo);
});

final signUpProvider = Provider<SignUp>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return SignUp(repo);
});

final signOutProvider = Provider<SignOut>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return SignOut(repo);
});

final getCurrentUserProvider = Provider<GetCurrentUser>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return GetCurrentUser(repo);
});

final sendEmailVerificationProvider = Provider<SendEmailVerification>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return SendEmailVerification(repo);
});

final isEmailVerifiedProvider = Provider<IsEmailVerified>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return IsEmailVerified(repo);
});

final reauthenticateUserProvider = Provider<ReauthenticateUser>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return ReauthenticateUser(repo);
});

final deleteAccountProvider = Provider<DeleteAccount>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return DeleteAccount(repo);
});

final startPhoneVerificationProvider = Provider<StartPhoneVerification>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return StartPhoneVerification(repo);
});

final verifyPhoneCodeProvider = Provider<VerifyPhoneCode>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return VerifyPhoneCode(repo);
});

final passwordResetProvider = Provider<PasswordReset>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return PasswordReset(repo);
});

class AuthNotifier extends StateNotifier<AsyncState<AuthUser?>> {
  final SignIn signInUseCase;
  final SignUp signUpUseCase;
  final SignOut signOutUseCase;
  final GetCurrentUser getCurrentUserUseCase;
  final PasswordReset passwordResetUseCase;
  final DeleteAccount deleteAccountUseCase;
  final StartPhoneVerification startPhoneVerificationUseCase;
  final VerifyPhoneCode verifyPhoneCodeUseCase;
  final ReauthenticateUser reauthenticateUserUseCase;
  final SendEmailVerification sendEmailVerificationUseCase;
  final IsEmailVerified isEmailVerifiedUseCase;
  final NotificationRepository notificationRepository;

  AuthNotifier({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.signOutUseCase,
    required this.getCurrentUserUseCase,
    required this.passwordResetUseCase,
    required this.deleteAccountUseCase,
    required this.startPhoneVerificationUseCase,
    required this.verifyPhoneCodeUseCase,
    required this.reauthenticateUserUseCase,
    required this.sendEmailVerificationUseCase,
    required this.isEmailVerifiedUseCase,
    required this.notificationRepository,
  }) : super(const AsyncState.data(null)) {
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    state = const AsyncState.loading();
    try {
      final user = await getCurrentUserUseCase();
      state = AsyncState.data(user);
    } catch (e) {
      AppLogger.error('Auth error', e, StackTrace.current);
      state = AsyncState.error(getErrorMessage(e));
    }
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncState.loading();
    try {
      final user = await signInUseCase(email: email, password: password);
      state = AsyncState.data(user);
      if (user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_id', user.id);
        await prefs.setString('user_email', user.email);
        final notification = AppNotification(
          id: 'login_${user.id}_${DateTime.now().millisecondsSinceEpoch}',
          userId: user.id,
          type: NotificationType.account,
          title: 'Login Successful',
          message: 'You have successfully logged in.',
          createdAt: DateTime.now(),
        );
        await notificationRepository.addNotification(notification);
      }
    } catch (e) {
      AppLogger.error('Auth error', e, StackTrace.current);
      state = AsyncState.error(getErrorMessage(e));
    }
  }

  Future<void> signUp(String email, String password,
      {String? displayName}) async {
    state = const AsyncState.loading();
    try {
      final user = await signUpUseCase(
          email: email, password: password, displayName: displayName);
      state = AsyncState.data(user);
      if (user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_id', user.id);
        await prefs.setString('user_email', user.email);
        final notification = AppNotification(
          id: 'signup_${user.id}_${DateTime.now().millisecondsSinceEpoch}',
          userId: user.id,
          type: NotificationType.account,
          title: 'Sign Up Successful',
          message: 'You have successfully signed up.',
          createdAt: DateTime.now(),
        );
        await notificationRepository.addNotification(notification);
      }
    } catch (e) {
      AppLogger.error('Auth error', e, StackTrace.current);
      state = AsyncState.error(getErrorMessage(e));
    }
  }

  Future<void> signOut() async {
    state = const AsyncState.loading();
    try {
      await signOutUseCase();
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user_id');
      await prefs.remove('user_email');
      state = const AsyncState.data(null);
    } catch (e) {
      AppLogger.error('Auth error', e, StackTrace.current);
      state = AsyncState.error(getErrorMessage(e));
    }
  }

  Future<void> sendPasswordReset(String email) async {
    state = const AsyncState.loading();
    try {
      await passwordResetUseCase(email: email);
      state = const AsyncState.data(null);
    } catch (e) {
      AppLogger.error('Auth error', e, StackTrace.current);
      state = AsyncState.error(getErrorMessage(e));
    }
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncState<AuthUser?>>((ref) {
  final notificationRepo = ref.read(notificationRepositoryProvider);
  return AuthNotifier(
    signInUseCase: ref.watch(signInProvider),
    signUpUseCase: ref.watch(signUpProvider),
    signOutUseCase: ref.watch(signOutProvider),
    getCurrentUserUseCase: ref.watch(getCurrentUserProvider),
    passwordResetUseCase: ref.watch(passwordResetProvider),
    deleteAccountUseCase: ref.watch(deleteAccountProvider),
    startPhoneVerificationUseCase: ref.watch(startPhoneVerificationProvider),
    verifyPhoneCodeUseCase: ref.watch(verifyPhoneCodeProvider),
    reauthenticateUserUseCase: ref.watch(reauthenticateUserProvider),
    sendEmailVerificationUseCase: ref.watch(sendEmailVerificationProvider),
    isEmailVerifiedUseCase: ref.watch(isEmailVerifiedProvider),
    notificationRepository: notificationRepo,
  );
});
