import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/core/error/app_exception.dart';

void main() {
  group('AppException', () {
    test('networkError', () {
      final e = AppException.networkError('msg');
      expect(e, isA<NetworkException>());
      expect(getErrorMessage(e), contains('networkError'));
    });
    test('serverError', () {
      final e = AppException.serverError('msg');
      expect(e, isA<ServerException>());
      expect(getErrorMessage(e), contains('serverError'));
    });
    test('cacheError', () {
      final e = AppException.cacheError('msg');
      expect(e, isA<CacheException>());
      expect(getErrorMessage(e), contains('cacheError'));
    });
    test('invalidInput', () {
      final e = AppException.invalidInput('msg');
      expect(e, isA<InvalidInputException>());
      expect(getErrorMessage(e), contains('invalidInput'));
    });
    test('unauthorized', () {
      final e = AppException.unauthorized('msg');
      expect(e, isA<UnauthorizedException>());
      expect(getErrorMessage(e), contains('unauthorized'));
    });
    test('notFound', () {
      final e = AppException.notFound('msg');
      expect(e, isA<NotFoundException>());
      expect(getErrorMessage(e), contains('notFound'));
    });
    test('unknown', () {
      final e = AppException.unknown('msg');
      expect(e, isA<UnknownException>());
      expect(getErrorMessage(e), contains('unknown'));
    });
  });

  group('Failure', () {
    test('constructs with message and exception', () {
      final failure = Failure(message: 'fail', exception: AppException.unknown('err'));
      expect(failure.message, 'fail');
      expect(failure.exception, isA<UnknownException>());
    });
  });
} 