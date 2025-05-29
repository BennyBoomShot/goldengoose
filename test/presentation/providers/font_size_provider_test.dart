import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/presentation/providers/font_size_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FontSizeNotifier', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
    });

    test('defaults to 16.0', () async {
      final notifier = FontSizeNotifier();
      await Future.delayed(Duration.zero);
      expect(notifier.state, 16.0);
    });

    test('can set and persist font size', () async {
      final notifier = FontSizeNotifier();
      await Future.delayed(Duration.zero);
      await notifier.setFontSize(20.0);
      expect(notifier.state, 20.0);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getDouble('font_size'), 20.0);
    });
  });
} 