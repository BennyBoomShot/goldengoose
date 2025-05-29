import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/error/app_exception.dart';
import '../../../shared/models/async_state.dart';
class CameraNotifier extends StateNotifier<AsyncState<List<CameraDescription>>> {
  CameraNotifier() : super(const AsyncState.loading()) {
    _init();
  }
  void _init() async {
    try {
      final cameras = await availableCameras();
      state = AsyncState.data(cameras);
    } catch (e) {
      state = AsyncState.error(getErrorMessage(e));
    }
  }
}
final cameraProvider = StateNotifierProvider<CameraNotifier, AsyncState<List<CameraDescription>>>(
  (ref) => CameraNotifier(),
); 