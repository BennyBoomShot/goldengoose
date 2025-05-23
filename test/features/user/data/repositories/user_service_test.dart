import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:goldengoose/features/user/data/repositories/user_service.dart';
import 'package:goldengoose/features/user/data/repositories/user_repository.dart';
import 'package:goldengoose/features/user/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository mockUserRepository;
  late UserService userService;

  setUp(() {
    mockUserRepository = MockUserRepository();
    userService = UserService(userRepository: mockUserRepository);
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
      final mockCredential = MockUserCredential();
      final mockAuthUser = MockUserAuth();
      when(() => mockUserRepository.createUserWithEmailAndPassword(email, password)).thenAnswer((_) async => mockCredential);
      when(() => mockCredential.user).thenReturn(mockAuthUser);
      when(() => mockAuthUser.uid).thenReturn(userId);
      when(() => mockAuthUser.emailVerified).thenReturn(false);
      when(() => mockUserRepository.create(any())).thenAnswer((_) async {});
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
      final user = User(
        id: 'user123',
        email: email,
        firstName: 'John',
        lastName: 'Doe',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      when(() => mockUserRepository.signInWithEmailAndPassword(email, password)).thenAnswer((_) async => MockUserCredential());
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
      when(() => mockUserRepository.signOut()).thenAnswer((_) async {});
      await userService.signOutUser();
      verify(() => mockUserRepository.signOut()).called(1);
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