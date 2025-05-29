import 'package:flutter/material.dart';

import '../../../core/presentation/forms/app_form_field.dart';
import '../../../core/presentation/widgets/app_button.dart';
import '../../../core/presentation/widgets/auth_error_message.dart';

class AuthFormWrapper extends StatefulWidget {
  final List<AppFormField> fields;
  final Future<void> Function() onSubmit;
  final bool isLoading;
  final Object? error;
  final String submitLabel;

  const AuthFormWrapper({
    super.key,
    required this.fields,
    required this.onSubmit,
    this.isLoading = false,
    this.error,
    required this.submitLabel,
  });

  @override
  State<AuthFormWrapper> createState() => _AuthFormWrapperState();
}

class _AuthFormWrapperState extends State<AuthFormWrapper> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...widget.fields,
          const SizedBox(height: 16),
          if (widget.error != null) AuthErrorMessage(error: widget.error),
          widget.isLoading
              ? const CircularProgressIndicator()
              : AppButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      await widget.onSubmit();
                    }
                  },
                  child: Text(widget.submitLabel),
                ),
        ],
      ),
    );
  }
}