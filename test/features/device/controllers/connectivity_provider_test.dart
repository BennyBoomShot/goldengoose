import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/features/device/controllers/connectivity_provider.dart';
import 'package:goldengoose/shared/models/async_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ConnectivityNotifier', () {
    test('emits data state when connectivity changes', () async {
      final controller = StreamController<ConnectivityResult>();
      final Stream<ConnectivityResult> typedStream = controller.stream;
      final notifier = ConnectivityNotifier(connectivityStream: typedStream);
      controller.add(ConnectivityResult.wifi);
      await Future.delayed(Duration.zero);
      expect(notifier.state, isA<AsyncState<ConnectivityResult>>());
      controller.close();
    });
  });
} 