import '../repositories/role_repository.dart';

class CheckUserRole {
  final IRoleRepository repository;
  CheckUserRole(this.repository);

  Future<bool> call(String userId, String roleName) {
    return repository.checkUserRole(userId, roleName);
  }
} 