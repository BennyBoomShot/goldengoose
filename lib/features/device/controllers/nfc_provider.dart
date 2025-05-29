import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/models/async_state.dart';
import '../../../core/error/app_exception.dart';
class NFCNotifier extends StateNotifier<AsyncState<bool>> {
  NFCNotifier() : super(const AsyncState.data(false));
  // Implement NFC logic here
}
final nfcProvider = StateNotifierProvider<NFCNotifier, AsyncState<bool>>(
  (ref) => NFCNotifier(),
); 