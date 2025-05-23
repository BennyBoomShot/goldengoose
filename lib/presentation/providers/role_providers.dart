import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goldengoose/features/roles/data/repositories/role_repository.dart';
import 'package:goldengoose/features/roles/domain/usecases/create_role.dart';
import 'package:goldengoose/features/roles/domain/usecases/get_role.dart';
import 'package:goldengoose/features/roles/domain/usecases/update_role.dart';
import 'package:goldengoose/features/roles/domain/usecases/delete_role.dart';
import 'package:goldengoose/features/roles/domain/usecases/list_roles.dart';
import 'package:goldengoose/features/roles/domain/usecases/assign_role_to_user.dart';
import 'package:goldengoose/features/roles/domain/usecases/get_user_roles.dart';
import 'package:goldengoose/features/roles/domain/usecases/check_user_role.dart';

final roleRepositoryProvider = Provider<RoleRepository>((ref) => RoleRepository());

final createRoleProvider = Provider<CreateRole>((ref) {
  final repo = ref.read(roleRepositoryProvider);
  return CreateRole(repo);
});

final getRoleProvider = Provider<GetRole>((ref) {
  final repo = ref.read(roleRepositoryProvider);
  return GetRole(repo);
});

final updateRoleProvider = Provider<UpdateRole>((ref) {
  final repo = ref.read(roleRepositoryProvider);
  return UpdateRole(repo);
});

final deleteRoleProvider = Provider<DeleteRole>((ref) {
  final repo = ref.read(roleRepositoryProvider);
  return DeleteRole(repo);
});

final listRolesProvider = Provider<ListRoles>((ref) {
  final repo = ref.read(roleRepositoryProvider);
  return ListRoles(repo);
});

final assignRoleToUserProvider = Provider<AssignRoleToUser>((ref) {
  final repo = ref.read(roleRepositoryProvider);
  return AssignRoleToUser(repo);
});

final getUserRolesProvider = Provider<GetUserRoles>((ref) {
  final repo = ref.read(roleRepositoryProvider);
  return GetUserRoles(repo);
});

final checkUserRoleProvider = Provider<CheckUserRole>((ref) {
  final repo = ref.read(roleRepositoryProvider);
  return CheckUserRole(repo);
}); 