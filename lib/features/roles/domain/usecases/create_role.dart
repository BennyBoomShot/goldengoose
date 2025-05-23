import '../entities/role.dart';
import '../repositories/role_repository.dart';

class CreateRole {
  final IRoleRepository repository;
  CreateRole(this.repository);

  Future<void> call(Role role) {
    return repository.createRole(role);
  }
} 