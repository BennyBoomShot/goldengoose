import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/core/models/user.dart';
void main() {
  group('User Entity', () {
    final user = User(
      id: '1',
      email: 'test@example.com',
      firstName: 'John',
      lastName: 'Doe',
      phoneNumber: '1234567890',
      profileImageUrl: 'http://image.url',
      isVerified: true,
      createdAt: DateTime.parse('2023-01-01T00:00:00.000'),
      updatedAt: DateTime.parse('2023-01-02T00:00:00.000'),
    );

    test('should serialize/deserialize correctly', () {
      final json = user.toJson();
      final fromJson = User.fromJson(json);
      expect(fromJson, user);
    });

    test('should support copyWith', () {
      final updated = user.copyWith(firstName: 'Jane');
      expect(updated.firstName, 'Jane');
      expect(updated.lastName, user.lastName);
    });

    test('should support equality', () {
      final user2 = user.copyWith();
      expect(user, user2);
    });

    test('should handle missing optional fields and default values', () {
      final now = DateTime.now();
      final user = User(
        id: '2',
        email: 'other@example.com',
        firstName: 'Alice',
        lastName: 'Smith',
        createdAt: now,
        updatedAt: now,
      );
      expect(user.phoneNumber, isNull);
      expect(user.profileImageUrl, isNull);
      expect(user.isVerified, false);
    });
  });
} 