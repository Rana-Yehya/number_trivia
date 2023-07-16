part of 'number_bloc.dart';

@freezed
class NumberState with _$NumberState {
  const factory NumberState({
    required InputNumber number,
    required OutputText text,
    required AutovalidateMode? showErrorMsg,
    required bool isSubmitting,
    //
    required Option<Either<Failure, Unit>> resultFailureOrSuccessOption,
  }) = _NumberState;

  factory NumberState.initial() => NumberState(
        number: InputNumber('0'),
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: false,
        resultFailureOrSuccessOption: none(),
      );
}
