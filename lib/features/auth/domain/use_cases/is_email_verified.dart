import '../repositories/auth_repository.dart';

class IsEmailVerified {
  final IAuthRepository repository;
  IsEmailVerified(this.repository);

  Future<bool> call() {
    return repository.isEmailVerified();
  }
} 