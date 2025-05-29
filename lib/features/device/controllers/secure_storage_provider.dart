import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../shared/models/async_state.dart';
import '../../../core/error/app_exception.dart';
class SecureStorageNotifier extends StateNotifier<AsyncState<FlutterSecureStorage>> {
  SecureStorageNotifier() : super(const AsyncState.loading()) {
    _init();
  }
  void _init() async {
    try {
      final storage = FlutterSecureStorage();
      state = AsyncState.data(storage);
    } catch (e) {
      state = AsyncState.error(getErrorMessage(e));
    }
  }
}
final secureStorageProvider = StateNotifierProvider<SecureStorageNotifier, AsyncState<FlutterSecureStorage>>(
  (ref) => SecureStorageNotifier(),
); 