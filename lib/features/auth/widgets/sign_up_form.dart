import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/presentation/forms/app_form_field.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../shared/models/async_state.dart';
import '../../../shared/utils/validator.dart';
import 'auth_form_wrapper.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _displayNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authProvider);
    final notifier = ref.read(authProvider.notifier);

    return AuthFormWrapper(
      fields: [
        AppFormField(controller: _displayNameController, label: 'Display Name', validator: (value) => validateRequired(value)),
        AppFormField(controller: _emailController, label: 'Email', validator: (value) => validateEmail(value)),
        AppFormField(controller: _passwordController, label: 'Password', obscureText: true, validator: (value) => validatePassword(value)),
      ],
      submitLabel: 'Sign Up',
      isLoading: state.isLoading,
      error: state.hasError ? state.error : null,
      onSubmit: () async {
        await notifier.signUp(_emailController.text, _passwordController.text, displayName: _displayNameController.text);
      },
    );
  }
}