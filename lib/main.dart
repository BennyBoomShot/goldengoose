import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/logger/app_logger.dart';
import 'data/datasources/remote/firebase/firebase_data_source.dart';
import 'data/datasources/remote/google/google_data_source.dart';
import 'data/datasources/remote/stripe/stripe_data_source.dart';
import 'app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final code = prefs.getString('selected_locale');
  final startLocale = code != null ? Locale(code) : Locale('en');

  runZonedGuarded(() async {
    // Set up error handling
    FlutterError.onError = (FlutterErrorDetails details) {
      AppLogger.error('Flutter Error', details.exception, details.stack);
    };

    // Initialize data sources
    final firebaseDataSource = FirebaseDataSource();
    final googleDataSource = GoogleDataSource();
    final stripeDataSource = StripeDataSource();

    try {
      await firebaseDataSource.initialize();
      await googleDataSource.initialize();
      await stripeDataSource.initialize();
    } catch (e, stack) {
      AppLogger.error('Failed to initialize data sources', e, stack);
      rethrow;
    }

    runApp(
      EasyLocalization(
        supportedLocales: [Locale('en'), Locale('es')],
        path: 'assets/lang',
        fallbackLocale: Locale('en'),
        startLocale: startLocale,
        child: ProviderScope(
          child: GoldenGooseApp(
            firebaseDataSource: firebaseDataSource,
            googleDataSource: googleDataSource,
            stripeDataSource: stripeDataSource,
          ),
        ),
      ),
    );
  }, (Object error, StackTrace stack) {
    AppLogger.fatal('Uncaught Error', error, stack);
  });
}
