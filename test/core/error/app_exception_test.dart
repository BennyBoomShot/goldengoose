import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/core/error/app_exception.dart';

void main() {
  group('AppException', () {
    test('networkError', () {
      final e = AppException.networkError('msg');
      expect(e, isA<NetworkException>());
      expect(e.toString(), contains('networkError'));
    });
    test('serverError', () {
      final e = AppException.serverError('msg');
      expect(e, isA<ServerException>());
      expect(e.toString(), contains('serverError'));
    });
    test('cacheError', () {
      final e = AppException.cacheError('msg');
      expect(e, isA<CacheException>());
      expect(e.toString(), contains('cacheError'));
    });
    test('invalidInput', () {
      final e = AppException.invalidInput('msg');
      expect(e, isA<InvalidInputException>());
      expect(e.toString(), contains('invalidInput'));
    });
    test('unauthorized', () {
      final e = AppException.unauthorized('msg');
      expect(e, isA<UnauthorizedException>());
      expect(e.toString(), contains('unauthorized'));
    });
    test('notFound', () {
      final e = AppException.notFound('msg');
      expect(e, isA<NotFoundException>());
      expect(e.toString(), contains('notFound'));
    });
    test('unknown', () {
      final e = AppException.unknown('msg');
      expect(e, isA<UnknownException>());
      expect(e.toString(), contains('unknown'));
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