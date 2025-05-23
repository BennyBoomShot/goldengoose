import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goldengoose/features/auth/data/datasources/firebase_auth_data_source.dart';
import 'package:goldengoose/features/auth/data/repositories/auth_repository.dart';
import 'package:goldengoose/features/auth/domain/usecases/sign_in.dart';
import 'package:goldengoose/features/auth/domain/usecases/sign_up.dart';
import 'package:goldengoose/features/auth/domain/usecases/sign_out.dart';
import 'package:goldengoose/features/auth/domain/usecases/get_current_user.dart';

final firebaseAuthDataSourceProvider = Provider<FirebaseAuthDataSource>((ref) => FirebaseAuthDataSource());

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dataSource = ref.read(firebaseAuthDataSourceProvider);
  return AuthRepository(dataSource: dataSource);
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