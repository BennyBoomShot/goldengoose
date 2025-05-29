import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/models/async_state.dart';
import '../../../core/error/app_exception.dart';
class CompassNotifier extends StateNotifier<AsyncState<double?>> {
  CompassNotifier() : super(const AsyncState.loading()) {
    _init();
  }
  void _init() {
    FlutterCompass.events?.listen(
      (event) => state = AsyncState.data(event.heading),
      onError: (e) => state = AsyncState.error(getErrorMessage(e)),
    );
  }
}
final compassProvider = StateNotifierProvider<CompassNotifier, AsyncState<double?>>(
  (ref) => CompassNotifier(),
); 