import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/features/roles/domain/entities/role.dart';

void main() {
  group('Role Entity', () {
    final role = Role(id: '1', name: 'admin', permissions: ['read', 'write']);

    test('should serialize/deserialize correctly', () {
      final json = role.toJson();
      final fromJson = Role.fromJson(json);
      expect(fromJson, role);
    });

    test('should support copyWith', () {
      final updated = role.copyWith(name: 'user');
      expect(updated.name, 'user');
      expect(updated.permissions, role.permissions);
    });

    test('should support equality', () {
      final role2 = role.copyWith();
      expect(role, role2);
    });
  });
} 