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

String getErrorMessage(dynamic error) {
  if (error is AppException) {
    return error.when(
      networkError: (msg) => msg ?? 'No internet connection.',
      serverError: (msg) => msg ?? 'Server error. Please try again later.',
      cacheError: (msg) => msg ?? 'Cache error.',
      invalidInput: (msg) => msg ?? 'Invalid input.',
      unauthorized: (msg) => msg ?? 'You are not authorized.',
      notFound: (msg) => msg ?? 'Resource not found.',
      unknown: (msg) => msg ?? 'An unknown error occurred.',
    );
  }
  return 'An error occurred. Please try again.';
}