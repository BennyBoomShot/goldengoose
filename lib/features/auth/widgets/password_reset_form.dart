import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/presentation/forms/app_form_field.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../shared/models/async_state.dart';
import '../../../shared/utils/validator.dart';
import 'auth_form_wrapper.dart';

class PasswordResetForm extends ConsumerStatefulWidget {
  const PasswordResetForm({super.key});

  @override
  ConsumerState<PasswordResetForm> createState() => _PasswordResetFormState();
}

class _PasswordResetFormState extends ConsumerState<PasswordResetForm> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final notifier = ref.read(authProvider.notifier);

    return AuthFormWrapper(
      fields: [
        AppFormField(controller: _emailController, label: 'Email', validator: (value) => validateEmail(value)),
      ],
      submitLabel: 'Send Password Reset Email',
      isLoading: authState.isLoading,
      error: authState.error,
      onSubmit: () async {
        await notifier.sendPasswordReset(_emailController.text);
      },
    );
  }
} 

