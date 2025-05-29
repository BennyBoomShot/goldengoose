import 'package:flutter/material.dart';

import 'data/datasources/remote/firebase/firebase_data_source.dart';
import 'data/datasources/remote/google/google_data_source.dart';
import 'data/datasources/remote/stripe/stripe_data_source.dart';
import 'presentation/themes/app_theme.dart';

class GoldenGooseApp extends StatelessWidget {
  final FirebaseDataSource firebaseDataSource;
  final GoogleDataSource googleDataSource;
  final StripeDataSource stripeDataSource;

  const GoldenGooseApp({
    super.key,
    required this.firebaseDataSource,
    required this.googleDataSource,
    required this.stripeDataSource,
  });

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
