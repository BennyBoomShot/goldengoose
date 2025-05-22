import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_state.freezed.dart';

@freezed
class AsyncState<T> with _$AsyncState<T> {
  const factory AsyncState.loading() = _Loading<T>;
  const factory AsyncState.data(T value) = _Data<T>;
  const factory AsyncState.error(String message) = _Error<T>;
} 