import '../entities/role.dart';
import '../repositories/role_repository.dart';

class GetUserRoles {
  final IRoleRepository repository;
  GetUserRoles(this.repository);

  Future<List<Role>> call(String userId) {
    return repository.getUserRoles(userId);
  }
} 