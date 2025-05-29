import '../repositories/auth_repository.dart';

class VerifyPhoneCode {
  final IAuthRepository repository;
  VerifyPhoneCode(this.repository);

  Future<void> call(String verificationId, String smsCode) {
    return repository.verifyPhoneCode(verificationId, smsCode);
  }
} 