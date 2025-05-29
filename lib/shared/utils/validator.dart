import '../../core/error/app_exception.dart';

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required.';
  }
  final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}0$');
  if (!emailRegex.hasMatch(value)) {
    return 'Enter a valid email address.';
  }
  return null;
}

String? validatePassword(String? value, {int minLength = 6}) {
  if (value == null || value.isEmpty) {
    return 'Password is required.';
  }
  if (value.length < minLength) {
    return 'Password must be at least $minLength characters.';
  }
  return null;
}

String? validateRequired(String? value, {String fieldName = 'This field'}) {
  if (value == null || value.trim().isEmpty) {
    return '$fieldName is required.';
  }
  return null;
}

String? validateMinLength(String? value, int minLength, {String fieldName = 'This field'}) {
  if (value == null || value.length < minLength) {
    return '$fieldName must be at least $minLength characters.';
  }
  return null;
}

String? validateMaxLength(String? value, int maxLength, {String fieldName = 'This field'}) {
  if (value != null && value.length > maxLength) {
    return '$fieldName must be at most $maxLength characters.';
  }
  return null;
}

void throwIfInvalid(String? error) {
  if (error != null) {
    throw AppException.invalidInput(error);
  }
}