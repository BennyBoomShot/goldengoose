import '../repositories/auth_repository.dart';

class ReauthenticateUser {
  final IAuthRepository repository;
  ReauthenticateUser(this.repository);

  Future<void> call({required String email, required String password}) {
    return repository.reauthenticateUser(email, password);
  }
} 