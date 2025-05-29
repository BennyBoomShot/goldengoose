import '../repositories/auth_repository.dart';

class DeleteAccount {
  final IAuthRepository repository;
  DeleteAccount(this.repository);

  Future<void> call() {
    return repository.deleteAccount();
  }
} 