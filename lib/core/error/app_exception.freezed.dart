// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppException {
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(String? message) serverError,
    required TResult Function(String? message) cacheError,
    required TResult Function(String? message) invalidInput,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(String? message)? serverError,
    TResult? Function(String? message)? cacheError,
    TResult? Function(String? message)? invalidInput,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(String? message)? serverError,
    TResult Function(String? message)? cacheError,
    TResult Function(String? message)? invalidInput,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) networkError,
    required TResult Function(ServerException value) serverError,
    required TResult Function(CacheException value) cacheError,
    required TResult Function(InvalidInputException value) invalidInput,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnknownException value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? networkError,
    TResult? Function(ServerException value)? serverError,
    TResult? Function(CacheException value)? cacheError,
    TResult? Function(InvalidInputException value)? invalidInput,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnknownException value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? networkError,
    TResult Function(ServerException value)? serverError,
    TResult Function(CacheException value)? cacheError,
    TResult Function(InvalidInputException value)? invalidInput,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppExceptionCopyWith<AppException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res, AppException>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res, $Val extends AppException>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$NetworkExceptionImplCopyWith(_$NetworkExceptionImpl value,
          $Res Function(_$NetworkExceptionImpl) then) =
      __$$NetworkExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$NetworkExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$NetworkExceptionImpl>
    implements _$$NetworkExceptionImplCopyWith<$Res> {
  __$$NetworkExceptionImplCopyWithImpl(_$NetworkExceptionImpl _value,
      $Res Function(_$NetworkExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NetworkExceptionImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NetworkExceptionImpl implements NetworkException {
  const _$NetworkExceptionImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.networkError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkExceptionImplCopyWith<_$NetworkExceptionImpl> get copyWith =>
      __$$NetworkExceptionImplCopyWithImpl<_$NetworkExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(String? message) serverError,
    required TResult Function(String? message) cacheError,
    required TResult Function(String? message) invalidInput,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unknown,
  }) {
    return networkError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(String? message)? serverError,
    TResult? Function(String? message)? cacheError,
    TResult? Function(String? message)? invalidInput,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unknown,
  }) {
    return networkError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(String? message)? serverError,
    TResult Function(String? message)? cacheError,
    TResult Function(String? message)? invalidInput,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) networkError,
    required TResult Function(ServerException value) serverError,
    required TResult Function(CacheException value) cacheError,
    required TResult Function(InvalidInputException value) invalidInput,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnknownException value) unknown,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? networkError,
    TResult? Function(ServerException value)? serverError,
    TResult? Function(CacheException value)? cacheError,
    TResult? Function(InvalidInputException value)? invalidInput,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? networkError,
    TResult Function(ServerException value)? serverError,
    TResult Function(CacheException value)? cacheError,
    TResult Function(InvalidInputException value)? invalidInput,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkException implements AppException {
  const factory NetworkException([final String? message]) =
      _$NetworkExceptionImpl;

  @override
  String? get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkExceptionImplCopyWith<_$NetworkExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$ServerExceptionImplCopyWith(_$ServerExceptionImpl value,
          $Res Function(_$ServerExceptionImpl) then) =
      __$$ServerExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ServerExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$ServerExceptionImpl>
    implements _$$ServerExceptionImplCopyWith<$Res> {
  __$$ServerExceptionImplCopyWithImpl(
      _$ServerExceptionImpl _value, $Res Function(_$ServerExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ServerExceptionImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ServerExceptionImpl implements ServerException {
  const _$ServerExceptionImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.serverError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerExceptionImplCopyWith<_$ServerExceptionImpl> get copyWith =>
      __$$ServerExceptionImplCopyWithImpl<_$ServerExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(String? message) serverError,
    required TResult Function(String? message) cacheError,
    required TResult Function(String? message) invalidInput,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unknown,
  }) {
    return serverError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(String? message)? serverError,
    TResult? Function(String? message)? cacheError,
    TResult? Function(String? message)? invalidInput,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unknown,
  }) {
    return serverError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(String? message)? serverError,
    TResult Function(String? message)? cacheError,
    TResult Function(String? message)? invalidInput,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) networkError,
    required TResult Function(ServerException value) serverError,
    required TResult Function(CacheException value) cacheError,
    required TResult Function(InvalidInputException value) invalidInput,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnknownException value) unknown,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? networkError,
    TResult? Function(ServerException value)? serverError,
    TResult? Function(CacheException value)? cacheError,
    TResult? Function(InvalidInputException value)? invalidInput,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? networkError,
    TResult Function(ServerException value)? serverError,
    TResult Function(CacheException value)? cacheError,
    TResult Function(InvalidInputException value)? invalidInput,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerException implements AppException {
  const factory ServerException([final String? message]) =
      _$ServerExceptionImpl;

  @override
  String? get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerExceptionImplCopyWith<_$ServerExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CacheExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$CacheExceptionImplCopyWith(_$CacheExceptionImpl value,
          $Res Function(_$CacheExceptionImpl) then) =
      __$$CacheExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$CacheExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$CacheExceptionImpl>
    implements _$$CacheExceptionImplCopyWith<$Res> {
  __$$CacheExceptionImplCopyWithImpl(
      _$CacheExceptionImpl _value, $Res Function(_$CacheExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$CacheExceptionImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CacheExceptionImpl implements CacheException {
  const _$CacheExceptionImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.cacheError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheExceptionImplCopyWith<_$CacheExceptionImpl> get copyWith =>
      __$$CacheExceptionImplCopyWithImpl<_$CacheExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(String? message) serverError,
    required TResult Function(String? message) cacheError,
    required TResult Function(String? message) invalidInput,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unknown,
  }) {
    return cacheError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(String? message)? serverError,
    TResult? Function(String? message)? cacheError,
    TResult? Function(String? message)? invalidInput,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unknown,
  }) {
    return cacheError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(String? message)? serverError,
    TResult Function(String? message)? cacheError,
    TResult Function(String? message)? invalidInput,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (cacheError != null) {
      return cacheError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) networkError,
    required TResult Function(ServerException value) serverError,
    required TResult Function(CacheException value) cacheError,
    required TResult Function(InvalidInputException value) invalidInput,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnknownException value) unknown,
  }) {
    return cacheError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? networkError,
    TResult? Function(ServerException value)? serverError,
    TResult? Function(CacheException value)? cacheError,
    TResult? Function(InvalidInputException value)? invalidInput,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return cacheError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? networkError,
    TResult Function(ServerException value)? serverError,
    TResult Function(CacheException value)? cacheError,
    TResult Function(InvalidInputException value)? invalidInput,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (cacheError != null) {
      return cacheError(this);
    }
    return orElse();
  }
}

abstract class CacheException implements AppException {
  const factory CacheException([final String? message]) = _$CacheExceptionImpl;

  @override
  String? get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CacheExceptionImplCopyWith<_$CacheExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidInputExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$InvalidInputExceptionImplCopyWith(
          _$InvalidInputExceptionImpl value,
          $Res Function(_$InvalidInputExceptionImpl) then) =
      __$$InvalidInputExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$InvalidInputExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$InvalidInputExceptionImpl>
    implements _$$InvalidInputExceptionImplCopyWith<$Res> {
  __$$InvalidInputExceptionImplCopyWithImpl(_$InvalidInputExceptionImpl _value,
      $Res Function(_$InvalidInputExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$InvalidInputExceptionImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InvalidInputExceptionImpl implements InvalidInputException {
  const _$InvalidInputExceptionImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.invalidInput(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidInputExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidInputExceptionImplCopyWith<_$InvalidInputExceptionImpl>
      get copyWith => __$$InvalidInputExceptionImplCopyWithImpl<
          _$InvalidInputExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(String? message) serverError,
    required TResult Function(String? message) cacheError,
    required TResult Function(String? message) invalidInput,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unknown,
  }) {
    return invalidInput(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(String? message)? serverError,
    TResult? Function(String? message)? cacheError,
    TResult? Function(String? message)? invalidInput,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unknown,
  }) {
    return invalidInput?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(String? message)? serverError,
    TResult Function(String? message)? cacheError,
    TResult Function(String? message)? invalidInput,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (invalidInput != null) {
      return invalidInput(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) networkError,
    required TResult Function(ServerException value) serverError,
    required TResult Function(CacheException value) cacheError,
    required TResult Function(InvalidInputException value) invalidInput,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnknownException value) unknown,
  }) {
    return invalidInput(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? networkError,
    TResult? Function(ServerException value)? serverError,
    TResult? Function(CacheException value)? cacheError,
    TResult? Function(InvalidInputException value)? invalidInput,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return invalidInput?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? networkError,
    TResult Function(ServerException value)? serverError,
    TResult Function(CacheException value)? cacheError,
    TResult Function(InvalidInputException value)? invalidInput,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (invalidInput != null) {
      return invalidInput(this);
    }
    return orElse();
  }
}

abstract class InvalidInputException implements AppException {
  const factory InvalidInputException([final String? message]) =
      _$InvalidInputExceptionImpl;

  @override
  String? get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidInputExceptionImplCopyWith<_$InvalidInputExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$UnauthorizedExceptionImplCopyWith(
          _$UnauthorizedExceptionImpl value,
          $Res Function(_$UnauthorizedExceptionImpl) then) =
      __$$UnauthorizedExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnauthorizedExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UnauthorizedExceptionImpl>
    implements _$$UnauthorizedExceptionImplCopyWith<$Res> {
  __$$UnauthorizedExceptionImplCopyWithImpl(_$UnauthorizedExceptionImpl _value,
      $Res Function(_$UnauthorizedExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UnauthorizedExceptionImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnauthorizedExceptionImpl implements UnauthorizedException {
  const _$UnauthorizedExceptionImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.unauthorized(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedExceptionImplCopyWith<_$UnauthorizedExceptionImpl>
      get copyWith => __$$UnauthorizedExceptionImplCopyWithImpl<
          _$UnauthorizedExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(String? message) serverError,
    required TResult Function(String? message) cacheError,
    required TResult Function(String? message) invalidInput,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unknown,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(String? message)? serverError,
    TResult? Function(String? message)? cacheError,
    TResult? Function(String? message)? invalidInput,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unknown,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(String? message)? serverError,
    TResult Function(String? message)? cacheError,
    TResult Function(String? message)? invalidInput,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) networkError,
    required TResult Function(ServerException value) serverError,
    required TResult Function(CacheException value) cacheError,
    required TResult Function(InvalidInputException value) invalidInput,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnknownException value) unknown,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? networkError,
    TResult? Function(ServerException value)? serverError,
    TResult? Function(CacheException value)? cacheError,
    TResult? Function(InvalidInputException value)? invalidInput,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? networkError,
    TResult Function(ServerException value)? serverError,
    TResult Function(CacheException value)? cacheError,
    TResult Function(InvalidInputException value)? invalidInput,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedException implements AppException {
  const factory UnauthorizedException([final String? message]) =
      _$UnauthorizedExceptionImpl;

  @override
  String? get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthorizedExceptionImplCopyWith<_$UnauthorizedExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$NotFoundExceptionImplCopyWith(_$NotFoundExceptionImpl value,
          $Res Function(_$NotFoundExceptionImpl) then) =
      __$$NotFoundExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$NotFoundExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$NotFoundExceptionImpl>
    implements _$$NotFoundExceptionImplCopyWith<$Res> {
  __$$NotFoundExceptionImplCopyWithImpl(_$NotFoundExceptionImpl _value,
      $Res Function(_$NotFoundExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NotFoundExceptionImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NotFoundExceptionImpl implements NotFoundException {
  const _$NotFoundExceptionImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.notFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundExceptionImplCopyWith<_$NotFoundExceptionImpl> get copyWith =>
      __$$NotFoundExceptionImplCopyWithImpl<_$NotFoundExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(String? message) serverError,
    required TResult Function(String? message) cacheError,
    required TResult Function(String? message) invalidInput,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unknown,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(String? message)? serverError,
    TResult? Function(String? message)? cacheError,
    TResult? Function(String? message)? invalidInput,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unknown,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(String? message)? serverError,
    TResult Function(String? message)? cacheError,
    TResult Function(String? message)? invalidInput,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) networkError,
    required TResult Function(ServerException value) serverError,
    required TResult Function(CacheException value) cacheError,
    required TResult Function(InvalidInputException value) invalidInput,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnknownException value) unknown,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? networkError,
    TResult? Function(ServerException value)? serverError,
    TResult? Function(CacheException value)? cacheError,
    TResult? Function(InvalidInputException value)? invalidInput,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? networkError,
    TResult Function(ServerException value)? serverError,
    TResult Function(CacheException value)? cacheError,
    TResult Function(InvalidInputException value)? invalidInput,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundException implements AppException {
  const factory NotFoundException([final String? message]) =
      _$NotFoundExceptionImpl;

  @override
  String? get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundExceptionImplCopyWith<_$NotFoundExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$UnknownExceptionImplCopyWith(_$UnknownExceptionImpl value,
          $Res Function(_$UnknownExceptionImpl) then) =
      __$$UnknownExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnknownExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UnknownExceptionImpl>
    implements _$$UnknownExceptionImplCopyWith<$Res> {
  __$$UnknownExceptionImplCopyWithImpl(_$UnknownExceptionImpl _value,
      $Res Function(_$UnknownExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UnknownExceptionImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnknownExceptionImpl implements UnknownException {
  const _$UnknownExceptionImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownExceptionImplCopyWith<_$UnknownExceptionImpl> get copyWith =>
      __$$UnknownExceptionImplCopyWithImpl<_$UnknownExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(String? message) serverError,
    required TResult Function(String? message) cacheError,
    required TResult Function(String? message) invalidInput,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unknown,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(String? message)? serverError,
    TResult? Function(String? message)? cacheError,
    TResult? Function(String? message)? invalidInput,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unknown,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(String? message)? serverError,
    TResult Function(String? message)? cacheError,
    TResult Function(String? message)? invalidInput,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) networkError,
    required TResult Function(ServerException value) serverError,
    required TResult Function(CacheException value) cacheError,
    required TResult Function(InvalidInputException value) invalidInput,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnknownException value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? networkError,
    TResult? Function(ServerException value)? serverError,
    TResult? Function(CacheException value)? cacheError,
    TResult? Function(InvalidInputException value)? invalidInput,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? networkError,
    TResult Function(ServerException value)? serverError,
    TResult Function(CacheException value)? cacheError,
    TResult Function(InvalidInputException value)? invalidInput,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownException implements AppException {
  const factory UnknownException([final String? message]) =
      _$UnknownExceptionImpl;

  @override
  String? get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownExceptionImplCopyWith<_$UnknownExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
