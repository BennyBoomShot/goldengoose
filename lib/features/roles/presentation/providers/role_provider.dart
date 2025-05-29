import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/role_repository.dart';
import '../../domain/entities/role.dart';
import '../../domain/repositories/role_repository.dart';
import '../../domain/use_cases/assign_role_to_user.dart';
import '../../domain/use_cases/check_user_role.dart';
import '../../domain/use_cases/create_role.dart';
import '../../domain/use_cases/delete_role.dart';
import '../../domain/use_cases/get_user_roles.dart';
import '../../domain/use_cases/list_roles.dart';
import '../../domain/use_cases/update_role.dart';

final roleRepositoryProvider = Provider<IRoleRepository>((ref) {
  return RoleRepository();
});

class RoleListNotifier extends StateNotifier<AsyncValue<List<Role>>> {
  final ListRoles listRolesUseCase;
  final CreateRole createRoleUseCase;
  final UpdateRole updateRoleUseCase;
  final DeleteRole deleteRoleUseCase;
  final AssignRoleToUser assignRoleToUserUseCase;
  final GetUserRoles getUserRolesUseCase;
  final CheckUserRole checkUserRoleUseCase;

  RoleListNotifier({
    required this.listRolesUseCase,
    required this.createRoleUseCase,
    required this.updateRoleUseCase,
    required this.deleteRoleUseCase,
    required this.assignRoleToUserUseCase,
    required this.getUserRolesUseCase,
    required this.checkUserRoleUseCase,
  }) : super(const AsyncValue.loading()) {
    loadRoles();
  }

  Future<void> loadRoles() async {
    state = const AsyncValue.loading();
    try {
      final roles = await listRolesUseCase();
      state = AsyncValue.data(roles);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createRole(Role role) async {
    try {
      await createRoleUseCase(role);
      await loadRoles();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateRole(Role role) async {
    try {
      await updateRoleUseCase(role);
      await loadRoles();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteRole(String roleId) async {
    try {
      await deleteRoleUseCase(roleId);
      await loadRoles();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> assignRoleToUser(String userId, String roleId) async {
    try {
      await assignRoleToUserUseCase(userId, roleId);
    } catch (e) {
      // No state change, but could add error handling if needed
    }
  }

  Future<List<Role>> getUserRoles(String userId) async {
    return await getUserRolesUseCase(userId);
  }

  Future<bool> checkUserRole(String userId, String roleName) async {
    return await checkUserRoleUseCase(userId, roleName);
  }
}

final roleListProvider = StateNotifierProvider<RoleListNotifier, AsyncValue<List<Role>>>((ref) {
  final repo = ref.watch(roleRepositoryProvider);
  return RoleListNotifier(
    listRolesUseCase: ListRoles(repo),
    createRoleUseCase: CreateRole(repo),
    updateRoleUseCase: UpdateRole(repo),
    deleteRoleUseCase: DeleteRole(repo),
    assignRoleToUserUseCase: AssignRoleToUser(repo),
    getUserRolesUseCase: GetUserRoles(repo),
    checkUserRoleUseCase: CheckUserRole(repo),
  );
}); 