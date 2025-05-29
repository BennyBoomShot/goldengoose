
import '../repositories/auth_repository.dart';

class PasswordReset {
  final IAuthRepository repository;
  PasswordReset(this.repository);

  Future<void> call({required String email}) {
    return repository.sendPasswordReset(email);
  }
} 