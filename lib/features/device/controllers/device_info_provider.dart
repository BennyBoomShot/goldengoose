import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../../../shared/models/async_state.dart';

class DeviceInfoNotifier extends StateNotifier<AsyncState<BaseDeviceInfo>> {
  DeviceInfoNotifier() : super(const AsyncState.loading()) {
    _init();
  }
  void _init() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      final info = await deviceInfo.deviceInfo;
      state = AsyncState.data(info);
    } catch (e) {
      state = AsyncState.error(e.toString());
    }
  }
}
final deviceInfoProvider = StateNotifierProvider<DeviceInfoNotifier, AsyncState<BaseDeviceInfo>>(
  (ref) => DeviceInfoNotifier(),
); 