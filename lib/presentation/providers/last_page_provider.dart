import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final lastPageProvider = StateNotifierProvider<LastPageNotifier, String?>(
  (ref) => LastPageNotifier(),
);

class LastPageNotifier extends StateNotifier<String?> {
  static const _lastPageKey = 'last_page';

  LastPageNotifier() : super(null) {
    _loadLastPage();
  }

  Future<void> _loadLastPage() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getString(_lastPageKey);
  }

  Future<void> setLastPage(String page) async {
    state = page;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastPageKey, page);
  }
} 