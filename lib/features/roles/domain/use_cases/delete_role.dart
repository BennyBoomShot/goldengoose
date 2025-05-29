import '../repositories/role_repository.dart';

class DeleteRole {
  final IRoleRepository repository;
  DeleteRole(this.repository);

  Future<void> call(String roleId) {
    return repository.deleteRole(roleId);
  }
} 