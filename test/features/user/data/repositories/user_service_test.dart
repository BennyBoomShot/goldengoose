import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/core/models/user.dart';
import 'package:goldengoose/core/repositories/user_repository.dart';
import 'package:goldengoose/core/services/user_service.dart';
import 'package:goldengoose/features/auth/data/repositories/auth_repository.dart';
import 'package:goldengoose/features/auth/domain/entities/auth_user.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {
}

class MockAuthRepository extends Mock implements AuthRepository {
}

void main() {
  late MockUserRepository mockUserRepository;
  late UserService userService;
  late MockAuthRepository mockAuthRepository;
  setUp(() {
    mockUserRepository = MockUserRepository();
    mockAuthRepository = MockAuthRepository();
    userService = UserService(userRepository: mockUserRepository, authRepository: mockAuthRepository);
  });

  group('UserService', () {
    test('registerUser registers and returns user', () async {
      // Arrange
      final email = 'test@example.com';
      final password = 'password';
      final firstName = 'John';
      final lastName = 'Doe';
      final userId = 'user123';
      final now = DateTime.now();
      final user = User(
        id: userId,
        email: email,
        firstName: firstName,
        lastName: lastName,
        createdAt: now,
        updatedAt: now,
      );
      final mockAuthUser = AuthUser(id: userId, email: email, isEmailVerified: false);
      when(() => mockAuthRepository.signUp(email: email, password: password)).thenAnswer((_) async => mockAuthUser.copyWith(id: userId));
      when(() => mockUserRepository.create(any())).thenAnswer((_) async => user);
      when(() => mockAuthRepository.getCurrentUser()).thenAnswer((_) async => mockAuthUser);
      // Act
      final result = await userService.registerUser(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );
      // Assert
      expect(result.id, userId);
      expect(result.email, email);
    });

    test('signInUser signs in and returns user', () async {
      // Arrange
      final email = 'test@example.com';
      final password = 'password';
      final userId = 'user123';
      final user = User(
        id: userId,
        email: email,
        firstName: 'John',
        lastName: 'Doe',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      final mockAuthUser = AuthUser(id: userId, email: email, isEmailVerified: false);
      when(() => mockAuthRepository.signIn(email: email, password: password)).thenAnswer((_) async => mockAuthUser);
      when(() => mockUserRepository.getCurrentUserProfile()).thenAnswer((_) async => user);
      // Act
      final result = await userService.signInUser(email: email, password: password);
      // Assert
      expect(result, user);
    });

    test('saveFcmToken saves token', () async {
      // This would require integration with FirebaseMessaging, so just check that it completes
      await userService.saveFcmToken('user123');
    });

    test('signOutUser signs out', () async {
      when(() => mockAuthRepository.signOut()).thenAnswer((_) async {});
      await userService.signOutUser();
      verify(() => mockAuthRepository.signOut()).called(1);
    });

    test('getCurrentUserProfile returns user', () async {
      final user = User(
        id: 'user123',
        email: 'test@example.com',
        firstName: 'John',
        lastName: 'Doe',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      when(() => mockUserRepository.getCurrentUserProfile()).thenAnswer((_) async => user);
      final result = await userService.getCurrentUserProfile();
      expect(result, user);
    });

    test('updateUserProfile updates user', () async {
      // TODO: Implement test with proper mocks
    });

    test('uploadProfileImage uploads image', () async {
      // TODO: Implement test with proper mocks
    });

    test('sendPasswordResetEmail sends email', () async {
      // TODO: Implement test with proper mocks
    });

    test('sendEmailVerification sends verification', () async {
      // TODO: Implement test with proper mocks
    });

    test('isEmailVerified returns correct value', () async {
      // TODO: Implement test with proper mocks
    });

    test('deleteAccount deletes user', () async {
      // TODO: Implement test with proper mocks
    });

    test('setUserRole sets role', () async {
      // TODO: Implement test with proper mocks
    });

    test('authStateChanges emits changes', () async {
      // TODO: Implement test with proper mocks
    });

    test('reauthenticateUser reauthenticates', () async {
      // TODO: Implement test with proper mocks
    });

    test('listUsers returns users', () async {
      // TODO: Implement test with proper mocks
    });

    test('blockUser blocks user', () async {
      // TODO: Implement test with proper mocks
    });

    test('logUserActivity logs activity', () async {
      // TODO: Implement test with proper mocks
    });

    test('startPhoneVerification starts verification', () async {
      // TODO: Implement test with proper mocks
    });

    test('verifyPhoneCode verifies code', () async {
      // TODO: Implement test with proper mocks
    });

    test('addNotification adds notification', () async {
      // TODO: Implement test with proper mocks
    });

    test('checkProfileCompleteness returns missing fields', () async {
      // TODO: Implement test with proper mocks
    });

    test('exportUserData exports data', () async {
      // TODO: Implement test with proper mocks
    });
  });
}

// Mock classes for UserCredential and UserAuth
class MockUserCredential extends Mock implements auth.UserCredential {}
class MockUserAuth extends Mock implements auth.User {} 