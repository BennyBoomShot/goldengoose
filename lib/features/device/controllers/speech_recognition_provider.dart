import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/async_state.dart';

class SpeechRecognitionNotifier extends StateNotifier<AsyncState<String>> {
  SpeechRecognitionNotifier() : super(const AsyncState.data(''));
  // Implement speech recognition logic here
}
final speechRecognitionProvider = StateNotifierProvider<SpeechRecognitionNotifier, AsyncState<String>>(
  (ref) => SpeechRecognitionNotifier(),
); 