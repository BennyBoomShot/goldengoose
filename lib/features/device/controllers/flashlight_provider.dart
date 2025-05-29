import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torch_light/torch_light.dart';

import '../../../shared/models/async_state.dart';
import '../../../core/error/app_exception.dart';
class FlashlightNotifier extends StateNotifier<AsyncState<bool>> {
  FlashlightNotifier() : super(const AsyncState.data(false));
  Future<void> toggle(bool on) async {
    try {
      if (on) {
        await TorchLight.enableTorch();
      } else {
        await TorchLight.disableTorch();
      }
      state = AsyncState.data(on);
    } catch (e) {
      state = AsyncState.error(getErrorMessage(e));
    }
  }
}
final flashlightProvider = StateNotifierProvider<FlashlightNotifier, AsyncState<bool>>(
  (ref) => FlashlightNotifier(),
); 