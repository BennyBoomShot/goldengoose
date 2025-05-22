import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/models/async_state.dart';

class LocalStorageNotifier extends StateNotifier<AsyncState<SharedPreferences>> {
  LocalStorageNotifier() : super(const AsyncState.loading()) {
    _init();
  }
  void _init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      state = AsyncState.data(prefs);
    } catch (e) {
      state = AsyncState.error(e.toString());
    }
  }
}
final localStorageProvider = StateNotifierProvider<LocalStorageNotifier, AsyncState<SharedPreferences>>(
  (ref) => LocalStorageNotifier(),
); 