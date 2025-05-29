import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_state.freezed.dart';

@freezed
class AsyncState<T> with _$AsyncState<T> {
  const factory AsyncState.loading() = _Loading<T>;
  const factory AsyncState.data(T value) = _Data<T>;
  const factory AsyncState.error(String message) = _Error<T>;
}

extension AsyncStateX<T> on AsyncState<T> {
  bool get isLoading => this is _Loading<T>;
  bool get hasError => this is _Error<T>;
  String? get error => this is _Error<T> ? (this as _Error<T>).message : null;
  T? get data => this is _Data<T> ? (this as _Data<T>).value : null;
} 