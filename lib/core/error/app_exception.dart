import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException {
  const factory AppException.networkError([String? message]) = NetworkException;
  const factory AppException.serverError([String? message]) = ServerException;
  const factory AppException.cacheError([String? message]) = CacheException;
  const factory AppException.invalidInput([String? message]) = InvalidInputException;
  const factory AppException.unauthorized([String? message]) = UnauthorizedException;
  const factory AppException.notFound([String? message]) = NotFoundException;
  const factory AppException.unknown([String? message]) = UnknownException;
}

class Failure {
  final String message;
  final AppException exception;

  const Failure({
    required this.message,
    required this.exception,
  });
} 