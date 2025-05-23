import '../repositories/role_repository.dart';

class AssignRoleToUser {
  final IRoleRepository repository;
  AssignRoleToUser(this.repository);

  Future<void> call(String userId, String roleId) {
    return repository.assignRoleToUser(userId, roleId);
  }
} 