import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/presentation/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ThemeModeNotifier', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
    });

    test('defaults to system theme', () async {
      final notifier = ThemeModeNotifier();
      await Future.delayed(Duration.zero); // allow async init
      expect(notifier.state, ThemeMode.system);
    });

    test('can set and persist theme', () async {
      final notifier = ThemeModeNotifier();
      await Future.delayed(Duration.zero);
      await notifier.setTheme(ThemeMode.dark);
      expect(notifier.state, ThemeMode.dark);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('theme_mode'), ThemeMode.dark.toString());
    });
  });
} 