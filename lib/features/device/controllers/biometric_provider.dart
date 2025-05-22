import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import '../../../shared/models/async_state.dart';

class BiometricNotifier extends StateNotifier<AsyncState<bool>> {
  final LocalAuthentication _auth = LocalAuthentication();
  BiometricNotifier() : super(const AsyncState.data(false));
  Future<void> authenticate() async {
    try {
      final didAuthenticate = await _auth.authenticate(
        localizedReason: 'Please authenticate',
      );
      state = AsyncState.data(didAuthenticate);
    } catch (e) {
      state = AsyncState.error(e.toString());
    }
  }
}
final biometricProvider = StateNotifierProvider<BiometricNotifier, AsyncState<bool>>(
  (ref) => BiometricNotifier(),
); 