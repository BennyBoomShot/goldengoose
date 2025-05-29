import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/models/async_state.dart';
class ScreenshotNotifier extends StateNotifier<AsyncState<String>> {
  ScreenshotNotifier() : super(const AsyncState.data(''));
  // Implement screenshot logic here
}
final screenshotProvider = StateNotifierProvider<ScreenshotNotifier, AsyncState<String>>(
  (ref) => ScreenshotNotifier(),
); 