import '../entities/role.dart';
import '../repositories/role_repository.dart';

class ListRoles {
  final IRoleRepository repository;
  ListRoles(this.repository);

  Future<List<Role>> call() {
    return repository.listRoles();
  }
} 