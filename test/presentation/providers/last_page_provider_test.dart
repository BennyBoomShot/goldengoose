import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:goldengoose/presentation/providers/last_page_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LastPageNotifier', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
    });

    test('defaults to null', () async {
      final notifier = LastPageNotifier();
      await Future.delayed(Duration.zero);
      expect(notifier.state, null);
    });

    test('can set and persist last page', () async {
      final notifier = LastPageNotifier();
      await Future.delayed(Duration.zero);
      await notifier.setLastPage('home');
      expect(notifier.state, 'home');
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('last_page'), 'home');
    });
  });
} 