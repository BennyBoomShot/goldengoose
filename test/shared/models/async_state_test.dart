import 'package:flutter_test/flutter_test.dart';
import 'package:goldengoose/shared/models/async_state.dart';

void main() {
  group('AsyncState', () {
    test('loading state', () {
      final state = AsyncState<int>.loading();
      expect(state, isA<AsyncState<int>>());
      expect(state, const AsyncState<int>.loading());
    });

    test('data state', () {
      final state = AsyncState<int>.data(42);
      expect(state, isA<AsyncState<int>>());
      expect(state, const AsyncState<int>.data(42));
    });

    test('error state', () {
      final state = AsyncState<int>.error('error');
      expect(state, isA<AsyncState<int>>());
      expect(state, const AsyncState<int>.error('error'));
    });
  });
} 