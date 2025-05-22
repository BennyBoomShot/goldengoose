import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_blue/flutter_blue.dart';
import '../../../shared/models/async_state.dart';

class BluetoothNotifier extends StateNotifier<AsyncState<BluetoothState>> {
  BluetoothNotifier() : super(const AsyncState.loading()) {
    _init();
  }
  void _init() {
    FlutterBlue.instance.state.listen(
      (stateValue) => state = AsyncState.data(stateValue),
      onError: (e) => state = AsyncState.error(e.toString()),
    );
  }
}
final bluetoothProvider = StateNotifierProvider<BluetoothNotifier, AsyncState<BluetoothState>>(
  (ref) => BluetoothNotifier(),
); 