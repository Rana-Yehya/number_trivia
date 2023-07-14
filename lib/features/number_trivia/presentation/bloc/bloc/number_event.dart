part of 'number_bloc.dart';

@freezed
class NumberEvent with _$NumberEvent {
  const factory NumberEvent.onNumberChanged({required String number}) =
      OnNumberChanged;
  const factory NumberEvent.getConcreteNumberButtonPressed() =
      GetConcreteNumberButtonPressed;
  const factory NumberEvent.getRandomNumberButtonPressed() =
      GetRandomNumberButtonPressed;
}