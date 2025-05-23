import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignUp {
  final IAuthRepository repository;
  SignUp(this.repository);

  Future<User?> call({required String email, required String password, String? displayName}) {
    return repository.signUp(email: email, password: password, displayName: displayName);
  }
} 