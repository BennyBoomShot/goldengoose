import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/models/async_state.dart';
import '../../../core/error/app_exception.dart';
class DeviceInfoNotifier extends StateNotifier<AsyncState<dynamic>> {
  DeviceInfoNotifier() : super(const AsyncState.loading()) {
    _init();
  }
  void _init() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      dynamic info;
      if (Platform.isAndroid) {
        info = await deviceInfo.androidInfo;
      } else if (Platform.isIOS) {
        info = await deviceInfo.iosInfo;
      } else if (Platform.isLinux) {
        info = await deviceInfo.linuxInfo;
      } else if (Platform.isMacOS) {
        info = await deviceInfo.macOsInfo;
      } else if (Platform.isWindows) {
        info = await deviceInfo.windowsInfo;
      } else {
        throw UnsupportedError('Unsupported platform');
      }
      state = AsyncState.data(info);
    } catch (e) {
      state = AsyncState.error(getErrorMessage(e));
    }
  }
}
final deviceInfoProvider = StateNotifierProvider<DeviceInfoNotifier, AsyncState<dynamic>>(
  (ref) => DeviceInfoNotifier(),
); 