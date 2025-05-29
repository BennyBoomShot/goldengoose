import 'package:flutter/material.dart';

class AppErrorMessage extends StatelessWidget {
  final String message;
  const AppErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(color: Colors.red),
    );
  }
} 