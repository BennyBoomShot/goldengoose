import 'package:flutter/material.dart';

import '../../widgets/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SignUpForm(),
        ),
      ),
    );
  }
} 