import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../shared/models/async_state.dart';

class ConnectivityNotifier extends StateNotifier<AsyncState<ConnectivityResult>> {
  ConnectivityNotifier({Stream<ConnectivityResult>? connectivityStream})
      : super(const AsyncState.loading()) {
    _init((connectivityStream ?? Connectivity().onConnectivityChanged) as Stream<ConnectivityResult>);
  }
  void _init(Stream<ConnectivityResult> stream) {
    stream.listen(
      (result) => state = AsyncState.data(result),
      onError: (e) => state = AsyncState.error(e.toString()),
    );
  }
}
final connectivityProvider = StateNotifierProvider<ConnectivityNotifier, AsyncState<ConnectivityResult>>(
  (ref) => ConnectivityNotifier(),
); 