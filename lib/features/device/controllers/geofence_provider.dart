import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/async_state.dart';

class GeofenceNotifier extends StateNotifier<AsyncState<String>> {
  GeofenceNotifier() : super(const AsyncState.data(''));
  // Implement geofencing logic here
  // Call state = AsyncState.data('Entered/Exited') or AsyncState.error(e.toString())
}
final geofenceProvider = StateNotifierProvider<GeofenceNotifier, AsyncState<String>>(
  (ref) => GeofenceNotifier(),
); 