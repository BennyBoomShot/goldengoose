import 'package:flutter/material.dart';
import 'presentation/themes/app_theme.dart';

class GoldenGooseApp extends StatelessWidget {
  const GoldenGooseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golden Goose',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const Scaffold(
        body: Center(
          child: Text('Welcome to Golden Goose'),
        ),
      ),
    );
  }
}
