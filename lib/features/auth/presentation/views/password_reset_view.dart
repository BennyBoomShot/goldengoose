import 'package:flutter/material.dart';

import '../../widgets/password_reset_form.dart';

class PasswordResetView extends StatelessWidget {
  const PasswordResetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: PasswordResetForm(),
        ),
      ),
    );
  }
} 