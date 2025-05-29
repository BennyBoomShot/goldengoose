import '../entities/role.dart';
import '../repositories/role_repository.dart';

class GetRole {
  final IRoleRepository repository;
  GetRole(this.repository);

  Future<Role?> call(String roleId) {
    return repository.getRole(roleId);
  }
} 