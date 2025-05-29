import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../../shared/models/async_state.dart';
import '../../../core/error/app_exception.dart';
class LocationNotifier extends StateNotifier<AsyncState<Position>> {
  LocationNotifier() : super(const AsyncState.loading()) {
    _init();
  }
  void _init() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) throw Exception('Location services are disabled.');
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) throw Exception('Location permissions are denied');
      }
      if (permission == LocationPermission.deniedForever) throw Exception('Location permissions are permanently denied');
      final position = await Geolocator.getCurrentPosition();
      state = AsyncState.data(position);
    } catch (e) {
      state = AsyncState.error(getErrorMessage(e));
    }
  }
}
final locationProvider = StateNotifierProvider<LocationNotifier, AsyncState<Position>>(
  (ref) => LocationNotifier(),
); 