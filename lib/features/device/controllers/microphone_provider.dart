import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/async_state.dart';

class MicrophoneNotifier extends StateNotifier<AsyncState<bool>> {
  MicrophoneNotifier() : super(const AsyncState.data(false));
  // Implement microphone logic here
}
final microphoneProvider = StateNotifierProvider<MicrophoneNotifier, AsyncState<bool>>(
  (ref) => MicrophoneNotifier(),
); 