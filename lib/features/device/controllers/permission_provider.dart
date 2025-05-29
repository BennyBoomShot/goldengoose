import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../shared/models/async_state.dart';
import '../../../core/error/app_exception.dart';
class PermissionNotifier extends StateNotifier<AsyncState<PermissionStatus>> {
  final Permission _permission;
  PermissionNotifier(this._permission) : super(const AsyncState.loading()) {
    _check();
  }
  void _check() async {
    try {
      final status = await _permission.status;
      state = AsyncState.data(status);
    } catch (e) {
      state = AsyncState.error(getErrorMessage(e));
    }
  }
  Future<void> request() async {
    try {
      final status = await _permission.request();
      state = AsyncState.data(status);
    } catch (e) {
      state = AsyncState.error(getErrorMessage(e));
    }
  }
}
final cameraPermissionProvider = StateNotifierProvider<PermissionNotifier, AsyncState<PermissionStatus>>(
  (ref) => PermissionNotifier(Permission.camera),
); 