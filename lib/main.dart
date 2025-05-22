import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/logger/app_logger.dart';
import 'app.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    // Set up error handling
    FlutterError.onError = (FlutterErrorDetails details) {
      AppLogger.error('Flutter Error', details.exception, details.stack);
    };

    runApp(
      const ProviderScope(
        child: GoldenGooseApp(),
      ),
    );
  }, (Object error, StackTrace stack) {
    AppLogger.fatal('Uncaught Error', error, stack);
  });
}
