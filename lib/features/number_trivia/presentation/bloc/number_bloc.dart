import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/errors/failure.dart';
import '../../domain/entities/number_data_classes.dart';
import '../../domain/entities/number_entity.dart';
import '../../domain/usecases/get_concrete_number.dart';
import '../../domain/usecases/get_random_number.dart';

part 'number_event.dart';
part 'number_state.dart';
part 'number_bloc.freezed.dart';

class NumberBloc extends Bloc<NumberEvent, NumberState> {
  final GetConcreteNumber getConcreteNumber;
  final GetRandomNumber getRandomNumber;
  NumberBloc({required this.getConcreteNumber, required this.getRandomNumber})
      : super(NumberState.initial()) {
    on<OnNumberChanged>((event, emit) => onNumberChanged(event, emit));
    on<GetConcreteNumberButtonPressed>(
        (event, emit) => getConcreteNumberButtonPressed(event, emit));
    on<GetRandomNumberButtonPressed>(
        (event, emit) => getRandomNumberButtonPressed(event, emit));
  }
  /* TODO */
  // Add values to OutputText in State
  void onNumberChanged(OnNumberChanged event, Emitter<NumberState> emit) {
    emit(
      state.copyWith(
        number: InputNumber(event.number),
        resultFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> getConcreteNumberButtonPressed(
      GetConcreteNumberButtonPressed event, Emitter<NumberState> emit) async {
    emit(
      state.copyWith(
        isSubmitting: true,
        resultFailureOrSuccessOption: none(),
      ),
    );
    final result = await getConcreteNumber(state.number);
    result.fold(
      (failure) => emit(
        state.copyWith(
          isSubmitting: false,
          showErrorMsg: AutovalidateMode.onUserInteraction,
          resultFailureOrSuccessOption: optionOf(Left(failure)),
        ),
      ),
      (value) => emit(
        state.copyWith(
          isSubmitting: false,
          text: value.text,
          number: value.number,
          showErrorMsg: AutovalidateMode.onUserInteraction,
          resultFailureOrSuccessOption: none(),
        ),
      ),
    );
    print(state);
  }

  Future<void> getRandomNumberButtonPressed(
      GetRandomNumberButtonPressed event, Emitter<NumberState> emit) async {
    emit(
      state.copyWith(
        isSubmitting: true,
        resultFailureOrSuccessOption: none(),
      ),
    );
    final result = await getRandomNumber(const EmptyClass());
    result.fold(
      (failure) => emit(
        state.copyWith(
          isSubmitting: false,
          showErrorMsg: AutovalidateMode.onUserInteraction,
          resultFailureOrSuccessOption: optionOf(Left(failure)),
        ),
      ),
      (value) => emit(
        state.copyWith(
          isSubmitting: false,
          number: value.number,//InputNumber('20'),//value.number,
          text: value.text,
          showErrorMsg: AutovalidateMode.onUserInteraction,
          resultFailureOrSuccessOption: none(),
        ),
      ),
    );

    //print(state);
  }
}
