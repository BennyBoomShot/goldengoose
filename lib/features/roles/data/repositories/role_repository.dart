import '../../domain/entities/role.dart';
import '../../domain/repositories/role_repository.dart';

class RoleRepository implements IRoleRepository {
  final Map<String, Role> _roles = {};
  final Map<String, List<String>> _userRoles = {};

  @override
  Future<void> createRole(Role role) async {
    _roles[role.id] = role;
  }

  @override
  Future<Role?> getRole(String roleId) async {
    return _roles[roleId];
  }

  @override
  Future<void> updateRole(Role role) async {
    _roles[role.id] = role;
  }

  @override
  Future<void> deleteRole(String roleId) async {
    _roles.remove(roleId);
  }

  @override
  Future<List<Role>> listRoles() async {
    return _roles.values.toList();
  }

  @override
  Future<void> assignRoleToUser(String userId, String roleId) async {
    _userRoles.putIfAbsent(userId, () => []);
    if (!_userRoles[userId]!.contains(roleId)) {
      _userRoles[userId]!.add(roleId);
    }
  }

  @override
  Future<List<Role>> getUserRoles(String userId) async {
    final roleIds = _userRoles[userId] ?? [];
    return roleIds.map((id) => _roles[id]).whereType<Role>().toList();
  }

  @override
  Future<bool> checkUserRole(String userId, String roleName) async {
    final roles = await getUserRoles(userId);
    return roles.any((role) => role.name == roleName);
  }
} 