import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../shared/models/async_state.dart';

class SecureStorageNotifier extends StateNotifier<AsyncState<FlutterSecureStorage>> {
  SecureStorageNotifier() : super(const AsyncState.loading()) {
    _init();
  }
  void _init() async {
    try {
      final storage = FlutterSecureStorage();
      state = AsyncState.data(storage);
    } catch (e) {
      state = AsyncState.error(e.toString());
    }
  }
}
final secureStorageProvider = StateNotifierProvider<SecureStorageNotifier, AsyncState<FlutterSecureStorage>>(
  (ref) => SecureStorageNotifier(),
); 