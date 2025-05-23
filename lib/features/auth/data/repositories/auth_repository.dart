import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/firebase_auth_data_source.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuthDataSource dataSource;
  AuthRepository({required this.dataSource});

  @override
  Future<User?> signIn({required String email, required String password}) async {
    final userMap = await dataSource.signIn(email: email, password: password);
    return userMap == null ? null : User.fromJson(userMap);
  }

  @override
  Future<User?> signUp({required String email, required String password, String? displayName}) async {
    final userMap = await dataSource.signUp(email: email, password: password, displayName: displayName);
    return userMap == null ? null : User.fromJson(userMap);
  }

  @override
  Future<void> signOut() async {
    await dataSource.signOut();
  }

  @override
  Future<User?> getCurrentUser() async {
    final userMap = await dataSource.getCurrentUser();
    return userMap == null ? null : User.fromJson(userMap);
  }
} 