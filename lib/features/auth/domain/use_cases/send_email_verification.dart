import '../repositories/auth_repository.dart';

class SendEmailVerification {
  final IAuthRepository repository;
  SendEmailVerification(this.repository);

  Future<void> call() {
    return repository.sendEmailVerification();
  }
} 