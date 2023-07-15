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
    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMsg: AutovalidateMode.onUserInteraction,
        resultFailureOrSuccessOption: some(result),
      ),
    );
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
    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMsg: AutovalidateMode.onUserInteraction,
        resultFailureOrSuccessOption: some(result),
      ),
    );
  }
}
