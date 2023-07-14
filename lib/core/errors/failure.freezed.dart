// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverFailure,
    required TResult Function() cacheFailure,
    required TResult Function() invalidEnteredValueByUser,
    required TResult Function(T error) unknownFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverFailure,
    TResult? Function()? cacheFailure,
    TResult? Function()? invalidEnteredValueByUser,
    TResult? Function(T error)? unknownFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverFailure,
    TResult Function()? cacheFailure,
    TResult Function()? invalidEnteredValueByUser,
    TResult Function(T error)? unknownFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure<T> value) serverFailure,
    required TResult Function(CacheFailure<T> value) cacheFailure,
    required TResult Function(InvalidEnteredValueByUser<T> value)
        invalidEnteredValueByUser,
    required TResult Function(UnknownFailure<T> value) unknownFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure<T> value)? serverFailure,
    TResult? Function(CacheFailure<T> value)? cacheFailure,
    TResult? Function(InvalidEnteredValueByUser<T> value)?
        invalidEnteredValueByUser,
    TResult? Function(UnknownFailure<T> value)? unknownFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure<T> value)? serverFailure,
    TResult Function(CacheFailure<T> value)? cacheFailure,
    TResult Function(InvalidEnteredValueByUser<T> value)?
        invalidEnteredValueByUser,
    TResult Function(UnknownFailure<T> value)? unknownFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<T, $Res> {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) then) =
      _$FailureCopyWithImpl<T, $Res, Failure<T>>;
}

/// @nodoc
class _$FailureCopyWithImpl<T, $Res, $Val extends Failure<T>>
    implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServerFailureCopyWith<T, $Res> {
  factory _$$ServerFailureCopyWith(
          _$ServerFailure<T> value, $Res Function(_$ServerFailure<T>) then) =
      __$$ServerFailureCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ServerFailureCopyWithImpl<T, $Res>
    extends _$FailureCopyWithImpl<T, $Res, _$ServerFailure<T>>
    implements _$$ServerFailureCopyWith<T, $Res> {
  __$$ServerFailureCopyWithImpl(
      _$ServerFailure<T> _value, $Res Function(_$ServerFailure<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServerFailure<T> implements ServerFailure<T> {
  const _$ServerFailure();

  @override
  String toString() {
    return 'Failure<$T>.serverFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerFailure<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverFailure,
    required TResult Function() cacheFailure,
    required TResult Function() invalidEnteredValueByUser,
    required TResult Function(T error) unknownFailure,
  }) {
    return serverFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverFailure,
    TResult? Function()? cacheFailure,
    TResult? Function()? invalidEnteredValueByUser,
    TResult? Function(T error)? unknownFailure,
  }) {
    return serverFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverFailure,
    TResult Function()? cacheFailure,
    TResult Function()? invalidEnteredValueByUser,
    TResult Function(T error)? unknownFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure<T> value) serverFailure,
    required TResult Function(CacheFailure<T> value) cacheFailure,
    required TResult Function(InvalidEnteredValueByUser<T> value)
        invalidEnteredValueByUser,
    required TResult Function(UnknownFailure<T> value) unknownFailure,
  }) {
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure<T> value)? serverFailure,
    TResult? Function(CacheFailure<T> value)? cacheFailure,
    TResult? Function(InvalidEnteredValueByUser<T> value)?
        invalidEnteredValueByUser,
    TResult? Function(UnknownFailure<T> value)? unknownFailure,
  }) {
    return serverFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure<T> value)? serverFailure,
    TResult Function(CacheFailure<T> value)? cacheFailure,
    TResult Function(InvalidEnteredValueByUser<T> value)?
        invalidEnteredValueByUser,
    TResult Function(UnknownFailure<T> value)? unknownFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(this);
    }
    return orElse();
  }
}

abstract class ServerFailure<T> implements Failure<T> {
  const factory ServerFailure() = _$ServerFailure<T>;
}

/// @nodoc
abstract class _$$CacheFailureCopyWith<T, $Res> {
  factory _$$CacheFailureCopyWith(
          _$CacheFailure<T> value, $Res Function(_$CacheFailure<T>) then) =
      __$$CacheFailureCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$CacheFailureCopyWithImpl<T, $Res>
    extends _$FailureCopyWithImpl<T, $Res, _$CacheFailure<T>>
    implements _$$CacheFailureCopyWith<T, $Res> {
  __$$CacheFailureCopyWithImpl(
      _$CacheFailure<T> _value, $Res Function(_$CacheFailure<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CacheFailure<T> implements CacheFailure<T> {
  const _$CacheFailure();

  @override
  String toString() {
    return 'Failure<$T>.cacheFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CacheFailure<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverFailure,
    required TResult Function() cacheFailure,
    required TResult Function() invalidEnteredValueByUser,
    required TResult Function(T error) unknownFailure,
  }) {
    return cacheFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverFailure,
    TResult? Function()? cacheFailure,
    TResult? Function()? invalidEnteredValueByUser,
    TResult? Function(T error)? unknownFailure,
  }) {
    return cacheFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverFailure,
    TResult Function()? cacheFailure,
    TResult Function()? invalidEnteredValueByUser,
    TResult Function(T error)? unknownFailure,
    required TResult orElse(),
  }) {
    if (cacheFailure != null) {
      return cacheFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure<T> value) serverFailure,
    required TResult Function(CacheFailure<T> value) cacheFailure,
    required TResult Function(InvalidEnteredValueByUser<T> value)
        invalidEnteredValueByUser,
    required TResult Function(UnknownFailure<T> value) unknownFailure,
  }) {
    return cacheFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure<T> value)? serverFailure,
    TResult? Function(CacheFailure<T> value)? cacheFailure,
    TResult? Function(InvalidEnteredValueByUser<T> value)?
        invalidEnteredValueByUser,
    TResult? Function(UnknownFailure<T> value)? unknownFailure,
  }) {
    return cacheFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure<T> value)? serverFailure,
    TResult Function(CacheFailure<T> value)? cacheFailure,
    TResult Function(InvalidEnteredValueByUser<T> value)?
        invalidEnteredValueByUser,
    TResult Function(UnknownFailure<T> value)? unknownFailure,
    required TResult orElse(),
  }) {
    if (cacheFailure != null) {
      return cacheFailure(this);
    }
    return orElse();
  }
}

abstract class CacheFailure<T> implements Failure<T> {
  const factory CacheFailure() = _$CacheFailure<T>;
}

/// @nodoc
abstract class _$$InvalidEnteredValueByUserCopyWith<T, $Res> {
  factory _$$InvalidEnteredValueByUserCopyWith(
          _$InvalidEnteredValueByUser<T> value,
          $Res Function(_$InvalidEnteredValueByUser<T>) then) =
      __$$InvalidEnteredValueByUserCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InvalidEnteredValueByUserCopyWithImpl<T, $Res>
    extends _$FailureCopyWithImpl<T, $Res, _$InvalidEnteredValueByUser<T>>
    implements _$$InvalidEnteredValueByUserCopyWith<T, $Res> {
  __$$InvalidEnteredValueByUserCopyWithImpl(
      _$InvalidEnteredValueByUser<T> _value,
      $Res Function(_$InvalidEnteredValueByUser<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidEnteredValueByUser<T> implements InvalidEnteredValueByUser<T> {
  const _$InvalidEnteredValueByUser();

  @override
  String toString() {
    return 'Failure<$T>.invalidEnteredValueByUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidEnteredValueByUser<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverFailure,
    required TResult Function() cacheFailure,
    required TResult Function() invalidEnteredValueByUser,
    required TResult Function(T error) unknownFailure,
  }) {
    return invalidEnteredValueByUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverFailure,
    TResult? Function()? cacheFailure,
    TResult? Function()? invalidEnteredValueByUser,
    TResult? Function(T error)? unknownFailure,
  }) {
    return invalidEnteredValueByUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverFailure,
    TResult Function()? cacheFailure,
    TResult Function()? invalidEnteredValueByUser,
    TResult Function(T error)? unknownFailure,
    required TResult orElse(),
  }) {
    if (invalidEnteredValueByUser != null) {
      return invalidEnteredValueByUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure<T> value) serverFailure,
    required TResult Function(CacheFailure<T> value) cacheFailure,
    required TResult Function(InvalidEnteredValueByUser<T> value)
        invalidEnteredValueByUser,
    required TResult Function(UnknownFailure<T> value) unknownFailure,
  }) {
    return invalidEnteredValueByUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure<T> value)? serverFailure,
    TResult? Function(CacheFailure<T> value)? cacheFailure,
    TResult? Function(InvalidEnteredValueByUser<T> value)?
        invalidEnteredValueByUser,
    TResult? Function(UnknownFailure<T> value)? unknownFailure,
  }) {
    return invalidEnteredValueByUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure<T> value)? serverFailure,
    TResult Function(CacheFailure<T> value)? cacheFailure,
    TResult Function(InvalidEnteredValueByUser<T> value)?
        invalidEnteredValueByUser,
    TResult Function(UnknownFailure<T> value)? unknownFailure,
    required TResult orElse(),
  }) {
    if (invalidEnteredValueByUser != null) {
      return invalidEnteredValueByUser(this);
    }
    return orElse();
  }
}

abstract class InvalidEnteredValueByUser<T> implements Failure<T> {
  const factory InvalidEnteredValueByUser() = _$InvalidEnteredValueByUser<T>;
}

/// @nodoc
abstract class _$$UnknownFailureCopyWith<T, $Res> {
  factory _$$UnknownFailureCopyWith(
          _$UnknownFailure<T> value, $Res Function(_$UnknownFailure<T>) then) =
      __$$UnknownFailureCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T error});
}

/// @nodoc
class __$$UnknownFailureCopyWithImpl<T, $Res>
    extends _$FailureCopyWithImpl<T, $Res, _$UnknownFailure<T>>
    implements _$$UnknownFailureCopyWith<T, $Res> {
  __$$UnknownFailureCopyWithImpl(
      _$UnknownFailure<T> _value, $Res Function(_$UnknownFailure<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$UnknownFailure<T>(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$UnknownFailure<T> implements UnknownFailure<T> {
  const _$UnknownFailure(this.error);

  @override
  final T error;

  @override
  String toString() {
    return 'Failure<$T>.unknownFailure(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownFailure<T> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownFailureCopyWith<T, _$UnknownFailure<T>> get copyWith =>
      __$$UnknownFailureCopyWithImpl<T, _$UnknownFailure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverFailure,
    required TResult Function() cacheFailure,
    required TResult Function() invalidEnteredValueByUser,
    required TResult Function(T error) unknownFailure,
  }) {
    return unknownFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverFailure,
    TResult? Function()? cacheFailure,
    TResult? Function()? invalidEnteredValueByUser,
    TResult? Function(T error)? unknownFailure,
  }) {
    return unknownFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverFailure,
    TResult Function()? cacheFailure,
    TResult Function()? invalidEnteredValueByUser,
    TResult Function(T error)? unknownFailure,
    required TResult orElse(),
  }) {
    if (unknownFailure != null) {
      return unknownFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure<T> value) serverFailure,
    required TResult Function(CacheFailure<T> value) cacheFailure,
    required TResult Function(InvalidEnteredValueByUser<T> value)
        invalidEnteredValueByUser,
    required TResult Function(UnknownFailure<T> value) unknownFailure,
  }) {
    return unknownFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure<T> value)? serverFailure,
    TResult? Function(CacheFailure<T> value)? cacheFailure,
    TResult? Function(InvalidEnteredValueByUser<T> value)?
        invalidEnteredValueByUser,
    TResult? Function(UnknownFailure<T> value)? unknownFailure,
  }) {
    return unknownFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure<T> value)? serverFailure,
    TResult Function(CacheFailure<T> value)? cacheFailure,
    TResult Function(InvalidEnteredValueByUser<T> value)?
        invalidEnteredValueByUser,
    TResult Function(UnknownFailure<T> value)? unknownFailure,
    required TResult orElse(),
  }) {
    if (unknownFailure != null) {
      return unknownFailure(this);
    }
    return orElse();
  }
}

abstract class UnknownFailure<T> implements Failure<T> {
  const factory UnknownFailure(final T error) = _$UnknownFailure<T>;

  T get error;
  @JsonKey(ignore: true)
  _$$UnknownFailureCopyWith<T, _$UnknownFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
