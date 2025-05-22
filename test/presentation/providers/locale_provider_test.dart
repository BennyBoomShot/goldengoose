import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:goldengoose/presentation/providers/locale_provider.dart';
import 'package:flutter/material.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LocaleNotifier', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
    });

    test('defaults to en locale', () async {
      final notifier = LocaleNotifier();
      await Future.delayed(Duration.zero);
      expect(notifier.state, const Locale('en'));
    });

    test('can set and persist locale', () async {
      final notifier = LocaleNotifier();
      await Future.delayed(Duration.zero);
      await notifier.setLocale(const Locale('es'));
      expect(notifier.state, const Locale('es'));
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('selected_locale'), 'es');
    });
  });
} 