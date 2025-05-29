import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/presentation/forms/app_form_field.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../shared/models/async_state.dart';
import '../../../shared/utils/validator.dart';
import 'auth_form_wrapper.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({super.key});

  @override
  ConsumerState<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authProvider);
    final notifier = ref.read(authProvider.notifier);

    return AuthFormWrapper(
      fields: [
        AppFormField(
          controller: emailController,
          label: 'Email',
          focusNode: emailFocus,
          nextFocus: passwordFocus,
          keyboardType: TextInputType.emailAddress,
          autofillHints: [AutofillHints.email],
          validator: validateEmail,
          prefixIcon: const Icon(Icons.email),
        ),
        AppFormField(
          controller: passwordController,
          label: 'Password',
          obscureText: true,
          focusNode: passwordFocus,
          textInputAction: TextInputAction.done,
          autofillHints: [AutofillHints.password],
          validator: validatePassword,
          prefixIcon: const Icon(Icons.lock),
          onFieldSubmitted: (_) async {
            await notifier.signIn(emailController.text, passwordController.text);
          },
        ),
      ],
      submitLabel: 'Sign In',
      isLoading: state.isLoading,
      error: state.error,
      onSubmit: () async {
        await notifier.signIn(emailController.text, passwordController.text);
      },
    );
  }
}
