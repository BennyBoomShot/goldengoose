import '../repositories/auth_repository.dart';

class StartPhoneVerification {
  final IAuthRepository repository;
  StartPhoneVerification(this.repository);

  Future<void> call(String phoneNumber, Function(String verificationId) onCodeSent) {
    return repository.startPhoneVerification(phoneNumber, onCodeSent);
  }
} 