import '../entities/role.dart';
import '../repositories/role_repository.dart';

class UpdateRole {
  final IRoleRepository repository;
  UpdateRole(this.repository);

  Future<void> call(Role role) {
    return repository.updateRole(role);
  }
} 