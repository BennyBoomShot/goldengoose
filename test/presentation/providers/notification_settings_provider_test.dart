import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:goldengoose/presentation/providers/notification_settings_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('NotificationSettingsNotifier', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
    });

    test('defaults to notifications enabled', () async {
      final notifier = NotificationSettingsNotifier();
      await Future.delayed(Duration.zero);
      expect(notifier.state, true);
    });

    test('can set and persist notifications', () async {
      final notifier = NotificationSettingsNotifier();
      await Future.delayed(Duration.zero);
      await notifier.setNotificationsEnabled(false);
      expect(notifier.state, false);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('notifications_enabled'), false);
    });
  });
} 