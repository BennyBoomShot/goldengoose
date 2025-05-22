import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final notificationSettingsProvider = StateNotifierProvider<NotificationSettingsNotifier, bool>(
  (ref) => NotificationSettingsNotifier(),
);

class NotificationSettingsNotifier extends StateNotifier<bool> {
  static const _notifKey = 'notifications_enabled';

  NotificationSettingsNotifier() : super(true) {
    _loadSetting();
  }

  Future<void> _loadSetting() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool(_notifKey) ?? true;
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    state = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_notifKey, enabled);
  }
} 