import '../entities/role.dart';

abstract class IRoleRepository {
  Future<void> createRole(Role role);
  Future<Role?> getRole(String roleId);
  Future<void> updateRole(Role role);
  Future<void> deleteRole(String roleId);
  Future<List<Role>> listRoles();
  Future<void> assignRoleToUser(String userId, String roleId);
  Future<List<Role>> getUserRoles(String userId);
  Future<bool> checkUserRole(String userId, String roleName);
} 