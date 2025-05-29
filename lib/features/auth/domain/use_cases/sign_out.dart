import '../repositories/auth_repository.dart';

class SignOut {
  final IAuthRepository repository;
  SignOut(this.repository);

  Future<void> call() {
    return repository.signOut();
  }
} 