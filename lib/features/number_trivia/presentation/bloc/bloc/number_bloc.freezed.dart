// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'number_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NumberEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String number) onNumberChanged,
    required TResult Function() getConcreteNumberButtonPressed,
    required TResult Function() getRandomNumberButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String number)? onNumberChanged,
    TResult? Function()? getConcreteNumberButtonPressed,
    TResult? Function()? getRandomNumberButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String number)? onNumberChanged,
    TResult Function()? getConcreteNumberButtonPressed,
    TResult Function()? getRandomNumberButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnNumberChanged value) onNumberChanged,
    required TResult Function(GetConcreteNumberButtonPressed value)
        getConcreteNumberButtonPressed,
    required TResult Function(GetRandomNumberButtonPressed value)
        getRandomNumberButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnNumberChanged value)? onNumberChanged,
    TResult? Function(GetConcreteNumberButtonPressed value)?
        getConcreteNumberButtonPressed,
    TResult? Function(GetRandomNumberButtonPressed value)?
        getRandomNumberButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnNumberChanged value)? onNumberChanged,
    TResult Function(GetConcreteNumberButtonPressed value)?
        getConcreteNumberButtonPressed,
    TResult Function(GetRandomNumberButtonPressed value)?
        getRandomNumberButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberEventCopyWith<$Res> {
  factory $NumberEventCopyWith(
          NumberEvent value, $Res Function(NumberEvent) then) =
      _$NumberEventCopyWithImpl<$Res, NumberEvent>;
}

/// @nodoc
class _$NumberEventCopyWithImpl<$Res, $Val extends NumberEvent>
    implements $NumberEventCopyWith<$Res> {
  _$NumberEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnNumberChangedCopyWith<$Res> {
  factory _$$OnNumberChangedCopyWith(
          _$OnNumberChanged value, $Res Function(_$OnNumberChanged) then) =
      __$$OnNumberChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String number});
}

/// @nodoc
class __$$OnNumberChangedCopyWithImpl<$Res>
    extends _$NumberEventCopyWithImpl<$Res, _$OnNumberChanged>
    implements _$$OnNumberChangedCopyWith<$Res> {
  __$$OnNumberChangedCopyWithImpl(
      _$OnNumberChanged _value, $Res Function(_$OnNumberChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
  }) {
    return _then(_$OnNumberChanged(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnNumberChanged implements OnNumberChanged {
  const _$OnNumberChanged({required this.number});

  @override
  final String number;

  @override
  String toString() {
    return 'NumberEvent.onNumberChanged(number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnNumberChanged &&
            (identical(other.number, number) || other.number == number));
  }

  @override
  int get hashCode => Object.hash(runtimeType, number);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnNumberChangedCopyWith<_$OnNumberChanged> get copyWith =>
      __$$OnNumberChangedCopyWithImpl<_$OnNumberChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String number) onNumberChanged,
    required TResult Function() getConcreteNumberButtonPressed,
    required TResult Function() getRandomNumberButtonPressed,
  }) {
    return onNumberChanged(number);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String number)? onNumberChanged,
    TResult? Function()? getConcreteNumberButtonPressed,
    TResult? Function()? getRandomNumberButtonPressed,
  }) {
    return onNumberChanged?.call(number);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String number)? onNumberChanged,
    TResult Function()? getConcreteNumberButtonPressed,
    TResult Function()? getRandomNumberButtonPressed,
    required TResult orElse(),
  }) {
    if (onNumberChanged != null) {
      return onNumberChanged(number);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnNumberChanged value) onNumberChanged,
    required TResult Function(GetConcreteNumberButtonPressed value)
        getConcreteNumberButtonPressed,
    required TResult Function(GetRandomNumberButtonPressed value)
        getRandomNumberButtonPressed,
  }) {
    return onNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnNumberChanged value)? onNumberChanged,
    TResult? Function(GetConcreteNumberButtonPressed value)?
        getConcreteNumberButtonPressed,
    TResult? Function(GetRandomNumberButtonPressed value)?
        getRandomNumberButtonPressed,
  }) {
    return onNumberChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnNumberChanged value)? onNumberChanged,
    TResult Function(GetConcreteNumberButtonPressed value)?
        getConcreteNumberButtonPressed,
    TResult Function(GetRandomNumberButtonPressed value)?
        getRandomNumberButtonPressed,
    required TResult orElse(),
  }) {
    if (onNumberChanged != null) {
      return onNumberChanged(this);
    }
    return orElse();
  }
}

abstract class OnNumberChanged implements NumberEvent {
  const factory OnNumberChanged({required final String number}) =
      _$OnNumberChanged;

  String get number;
  @JsonKey(ignore: true)
  _$$OnNumberChangedCopyWith<_$OnNumberChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetConcreteNumberButtonPressedCopyWith<$Res> {
  factory _$$GetConcreteNumberButtonPressedCopyWith(
          _$GetConcreteNumberButtonPressed value,
          $Res Function(_$GetConcreteNumberButtonPressed) then) =
      __$$GetConcreteNumberButtonPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetConcreteNumberButtonPressedCopyWithImpl<$Res>
    extends _$NumberEventCopyWithImpl<$Res, _$GetConcreteNumberButtonPressed>
    implements _$$GetConcreteNumberButtonPressedCopyWith<$Res> {
  __$$GetConcreteNumberButtonPressedCopyWithImpl(
      _$GetConcreteNumberButtonPressed _value,
      $Res Function(_$GetConcreteNumberButtonPressed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetConcreteNumberButtonPressed
    implements GetConcreteNumberButtonPressed {
  const _$GetConcreteNumberButtonPressed();

  @override
  String toString() {
    return 'NumberEvent.getConcreteNumberButtonPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetConcreteNumberButtonPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String number) onNumberChanged,
    required TResult Function() getConcreteNumberButtonPressed,
    required TResult Function() getRandomNumberButtonPressed,
  }) {
    return getConcreteNumberButtonPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String number)? onNumberChanged,
    TResult? Function()? getConcreteNumberButtonPressed,
    TResult? Function()? getRandomNumberButtonPressed,
  }) {
    return getConcreteNumberButtonPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String number)? onNumberChanged,
    TResult Function()? getConcreteNumberButtonPressed,
    TResult Function()? getRandomNumberButtonPressed,
    required TResult orElse(),
  }) {
    if (getConcreteNumberButtonPressed != null) {
      return getConcreteNumberButtonPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnNumberChanged value) onNumberChanged,
    required TResult Function(GetConcreteNumberButtonPressed value)
        getConcreteNumberButtonPressed,
    required TResult Function(GetRandomNumberButtonPressed value)
        getRandomNumberButtonPressed,
  }) {
    return getConcreteNumberButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnNumberChanged value)? onNumberChanged,
    TResult? Function(GetConcreteNumberButtonPressed value)?
        getConcreteNumberButtonPressed,
    TResult? Function(GetRandomNumberButtonPressed value)?
        getRandomNumberButtonPressed,
  }) {
    return getConcreteNumberButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnNumberChanged value)? onNumberChanged,
    TResult Function(GetConcreteNumberButtonPressed value)?
        getConcreteNumberButtonPressed,
    TResult Function(GetRandomNumberButtonPressed value)?
        getRandomNumberButtonPressed,
    required TResult orElse(),
  }) {
    if (getConcreteNumberButtonPressed != null) {
      return getConcreteNumberButtonPressed(this);
    }
    return orElse();
  }
}

abstract class GetConcreteNumberButtonPressed implements NumberEvent {
  const factory GetConcreteNumberButtonPressed() =
      _$GetConcreteNumberButtonPressed;
}

/// @nodoc
abstract class _$$GetRandomNumberButtonPressedCopyWith<$Res> {
  factory _$$GetRandomNumberButtonPressedCopyWith(
          _$GetRandomNumberButtonPressed value,
          $Res Function(_$GetRandomNumberButtonPressed) then) =
      __$$GetRandomNumberButtonPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetRandomNumberButtonPressedCopyWithImpl<$Res>
    extends _$NumberEventCopyWithImpl<$Res, _$GetRandomNumberButtonPressed>
    implements _$$GetRandomNumberButtonPressedCopyWith<$Res> {
  __$$GetRandomNumberButtonPressedCopyWithImpl(
      _$GetRandomNumberButtonPressed _value,
      $Res Function(_$GetRandomNumberButtonPressed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetRandomNumberButtonPressed implements GetRandomNumberButtonPressed {
  const _$GetRandomNumberButtonPressed();

  @override
  String toString() {
    return 'NumberEvent.getRandomNumberButtonPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRandomNumberButtonPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String number) onNumberChanged,
    required TResult Function() getConcreteNumberButtonPressed,
    required TResult Function() getRandomNumberButtonPressed,
  }) {
    return getRandomNumberButtonPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String number)? onNumberChanged,
    TResult? Function()? getConcreteNumberButtonPressed,
    TResult? Function()? getRandomNumberButtonPressed,
  }) {
    return getRandomNumberButtonPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String number)? onNumberChanged,
    TResult Function()? getConcreteNumberButtonPressed,
    TResult Function()? getRandomNumberButtonPressed,
    required TResult orElse(),
  }) {
    if (getRandomNumberButtonPressed != null) {
      return getRandomNumberButtonPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnNumberChanged value) onNumberChanged,
    required TResult Function(GetConcreteNumberButtonPressed value)
        getConcreteNumberButtonPressed,
    required TResult Function(GetRandomNumberButtonPressed value)
        getRandomNumberButtonPressed,
  }) {
    return getRandomNumberButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnNumberChanged value)? onNumberChanged,
    TResult? Function(GetConcreteNumberButtonPressed value)?
        getConcreteNumberButtonPressed,
    TResult? Function(GetRandomNumberButtonPressed value)?
        getRandomNumberButtonPressed,
  }) {
    return getRandomNumberButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnNumberChanged value)? onNumberChanged,
    TResult Function(GetConcreteNumberButtonPressed value)?
        getConcreteNumberButtonPressed,
    TResult Function(GetRandomNumberButtonPressed value)?
        getRandomNumberButtonPressed,
    required TResult orElse(),
  }) {
    if (getRandomNumberButtonPressed != null) {
      return getRandomNumberButtonPressed(this);
    }
    return orElse();
  }
}

abstract class GetRandomNumberButtonPressed implements NumberEvent {
  const factory GetRandomNumberButtonPressed() = _$GetRandomNumberButtonPressed;
}

/// @nodoc
mixin _$NumberState {
  InputNumber get number => throw _privateConstructorUsedError;
  OutputText get text => throw _privateConstructorUsedError;
  AutovalidateMode? get showErrorMsg => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<Failure, NumberEntity>> get resultFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NumberStateCopyWith<NumberState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberStateCopyWith<$Res> {
  factory $NumberStateCopyWith(
          NumberState value, $Res Function(NumberState) then) =
      _$NumberStateCopyWithImpl<$Res, NumberState>;
  @useResult
  $Res call(
      {InputNumber number,
      OutputText text,
      AutovalidateMode? showErrorMsg,
      bool isSubmitting,
      Option<Either<Failure, NumberEntity>> resultFailureOrSuccessOption});
}

/// @nodoc
class _$NumberStateCopyWithImpl<$Res, $Val extends NumberState>
    implements $NumberStateCopyWith<$Res> {
  _$NumberStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? text = null,
    Object? showErrorMsg = freezed,
    Object? isSubmitting = null,
    Object? resultFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as InputNumber,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as OutputText,
      showErrorMsg: freezed == showErrorMsg
          ? _value.showErrorMsg
          : showErrorMsg // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode?,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      resultFailureOrSuccessOption: null == resultFailureOrSuccessOption
          ? _value.resultFailureOrSuccessOption
          : resultFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, NumberEntity>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NumberStateCopyWith<$Res>
    implements $NumberStateCopyWith<$Res> {
  factory _$$_NumberStateCopyWith(
          _$_NumberState value, $Res Function(_$_NumberState) then) =
      __$$_NumberStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {InputNumber number,
      OutputText text,
      AutovalidateMode? showErrorMsg,
      bool isSubmitting,
      Option<Either<Failure, NumberEntity>> resultFailureOrSuccessOption});
}

/// @nodoc
class __$$_NumberStateCopyWithImpl<$Res>
    extends _$NumberStateCopyWithImpl<$Res, _$_NumberState>
    implements _$$_NumberStateCopyWith<$Res> {
  __$$_NumberStateCopyWithImpl(
      _$_NumberState _value, $Res Function(_$_NumberState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? text = null,
    Object? showErrorMsg = freezed,
    Object? isSubmitting = null,
    Object? resultFailureOrSuccessOption = null,
  }) {
    return _then(_$_NumberState(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as InputNumber,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as OutputText,
      showErrorMsg: freezed == showErrorMsg
          ? _value.showErrorMsg
          : showErrorMsg // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode?,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      resultFailureOrSuccessOption: null == resultFailureOrSuccessOption
          ? _value.resultFailureOrSuccessOption
          : resultFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, NumberEntity>>,
    ));
  }
}

/// @nodoc

class _$_NumberState implements _NumberState {
  const _$_NumberState(
      {required this.number,
      required this.text,
      required this.showErrorMsg,
      required this.isSubmitting,
      required this.resultFailureOrSuccessOption});

  @override
  final InputNumber number;
  @override
  final OutputText text;
  @override
  final AutovalidateMode? showErrorMsg;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<Failure, NumberEntity>> resultFailureOrSuccessOption;

  @override
  String toString() {
    return 'NumberState(number: $number, text: $text, showErrorMsg: $showErrorMsg, isSubmitting: $isSubmitting, resultFailureOrSuccessOption: $resultFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NumberState &&
            (identical(other.number.value, number.value) || other.number.value == number.value) &&
            (identical(other.text.value, text.value) || other.text.value == text.value) &&
            (identical(other.showErrorMsg, showErrorMsg) ||
                other.showErrorMsg == showErrorMsg) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.resultFailureOrSuccessOption,
                    resultFailureOrSuccessOption) ||
                other.resultFailureOrSuccessOption ==
                    resultFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, number, text, showErrorMsg,
      isSubmitting, resultFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NumberStateCopyWith<_$_NumberState> get copyWith =>
      __$$_NumberStateCopyWithImpl<_$_NumberState>(this, _$identity);
}

abstract class _NumberState implements NumberState {
  const factory _NumberState(
      {required final InputNumber number,
      required final OutputText text,
      required final AutovalidateMode? showErrorMsg,
      required final bool isSubmitting,
      required final Option<Either<Failure, NumberEntity>>
          resultFailureOrSuccessOption}) = _$_NumberState;

  @override
  InputNumber get number;
  @override
  OutputText get text;
  @override
  AutovalidateMode? get showErrorMsg;
  @override
  bool get isSubmitting;
  @override
  Option<Either<Failure, NumberEntity>> get resultFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_NumberStateCopyWith<_$_NumberState> get copyWith =>
      throw _privateConstructorUsedError;
}
