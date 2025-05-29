import 'package:flutter/material.dart';

import '../../error/app_exception.dart';
import 'app_error_message.dart';

class AuthErrorMessage extends StatelessWidget {
  final Object? error;
  const AuthErrorMessage({super.key, required this.error});
  @override
  Widget build(BuildContext context) {
    if (error == null) return const SizedBox.shrink();
    String message;
    if (error is AppException) {
      message = (error as AppException).when(
        networkError: (msg) => msg ?? 'Network error',
        serverError: (msg) => msg ?? 'Server error',
        cacheError: (msg) => msg ?? 'Cache error',
        invalidInput: (msg) => msg ?? 'Invalid input',
        unauthorized: (msg) => msg ?? 'Unauthorized',
        notFound: (msg) => msg ?? 'Not found',
        unknown: (msg) => msg ?? 'Unknown error',
      );
    } else {
      message = error.toString();
    }
    return AppErrorMessage(message: message);
  }
} 