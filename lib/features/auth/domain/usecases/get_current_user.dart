import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class GetCurrentUser {
  final IAuthRepository repository;
  GetCurrentUser(this.repository);

  Future<User?> call() {
    return repository.getCurrentUser();
  }
} 