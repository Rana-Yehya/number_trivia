import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/core/errors/failure.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_data_classes.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_entity.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_number.dart';
import 'package:number_trivia/features/number_trivia/infrastructure/models/number_model.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc/number_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

class MockNumberBloc extends MockBloc<NumberEvent, NumberState>
    implements NumberBloc {}

class MockGetConcreteNumber extends Mock implements GetConcreteNumber {}

class MockGetRandomNumber extends Mock implements GetRandomNumber {}

void main() {
  late MockGetConcreteNumber mockGetConcreteNumber;
  late MockGetRandomNumber mockGetRandomNumber;
  late NumberBloc numberBloc;
  //late MockNumberBloc mockNumberBloc;

  const tText = 'text';

  const tNumberConcrete = 4;
  final tInputNumberConcrete = InputNumber(tNumberConcrete.toString());
  const tNumberModelConcrete =
      NumberModel(number: tNumberConcrete, text: tText);
  final tNumberEntityConcrete = tNumberModelConcrete.toDomain();

  const tNumberRandom = 0;
  final tInputNumberRandom = InputNumber(tNumberRandom.toString());
  const tNumberModelRandom = NumberModel(number: tNumberRandom, text: tText);
  final tNumberEntityRandom = tNumberModelRandom.toDomain();

  setUp(() {
    mockGetConcreteNumber = MockGetConcreteNumber();
    mockGetRandomNumber = MockGetRandomNumber();
    numberBloc = NumberBloc(mockGetConcreteNumber, mockGetRandomNumber);
    //mockNumberBloc = MockNumberBloc();
  });
  setUpAll(() {
    registerFallbackValue(InputNumber('1'));
    registerFallbackValue(const EmptyClass());
    //registerFallbackValue(InputNumber('1'));
  });

  test('state should equal to initial', () {
    expect(numberBloc.state, NumberState.initial());
  });
  group('OnNumberChanged', () {
    final expectedSuccessResponse = [
      NumberState(
        number: tInputNumberConcrete,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: false,
        resultFailureOrSuccessOption: none(),
      ),
    ];
    final expectedFailureResponse = [
      NumberState(
        number: InputNumber('2dw'),
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: false,
        resultFailureOrSuccessOption: none(),
      ),
    ];
    blocTest<NumberBloc, NumberState>(
      'emits a successful changed number when a successful number is entered',
      build: () => numberBloc,
      act: (bloc) => bloc
          .add(NumberEvent.onNumberChanged(number: tNumberConcrete.toString())),
      expect: () => expectedSuccessResponse,
    );

    blocTest<NumberBloc, NumberState>(
      'emits InvalidEnteredValueByUser fallure when an unsuccessful number is entered',
      build: () => numberBloc,
      act: (bloc) => bloc.add(const NumberEvent.onNumberChanged(number: '2dw')),
      expect: () => expectedFailureResponse,
    );
  });
  group('GetConcreteNumberButtonPressed', () {
    final expectedSuccessResponse = [
      //NumberState.initial(),
      NumberState(
        number: tInputNumberConcrete,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: false,
        resultFailureOrSuccessOption: none(),
      ),
      NumberState(
        number: tInputNumberConcrete,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: true,
        resultFailureOrSuccessOption: none(),
      ),
      NumberState(
        number: tInputNumberConcrete,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.onUserInteraction,
        isSubmitting: false,
        resultFailureOrSuccessOption: some(Right(tNumberEntityConcrete)),
      ),
    ];

    final expectedServerFailureResponse = [
      //NumberState.initial(),
      NumberState(
        number: tInputNumberConcrete,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: false,
        resultFailureOrSuccessOption: none(),
      ),
      NumberState(
        number: tInputNumberConcrete,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: true,
        resultFailureOrSuccessOption: none(),
      ),
      NumberState(
        number: tInputNumberConcrete,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.onUserInteraction,
        isSubmitting: false,
        resultFailureOrSuccessOption: some(const Left(Failure.serverFailure())),
      ),
    ];
    final expectedCacheFailureResponse = [
      //NumberState.initial(),
      NumberState(
        number: tInputNumberConcrete,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: false,
        resultFailureOrSuccessOption: none(),
      ),
      NumberState(
        number: tInputNumberConcrete,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: true,
        resultFailureOrSuccessOption: none(),
      ),
      NumberState(
        number: tInputNumberConcrete,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.onUserInteraction,
        isSubmitting: false,
        resultFailureOrSuccessOption: some(const Left(Failure.cacheFailure())),
      ),
    ];
    final expectedUnknownFailureResponse = [
      //NumberState.initial(),
      NumberState(
        number: tInputNumberConcrete,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: false,
        resultFailureOrSuccessOption: none(),
      ),
      NumberState(
        number: tInputNumberConcrete,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: true,
        resultFailureOrSuccessOption: none(),
      ),
      NumberState(
        number: tInputNumberConcrete,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.onUserInteraction,
        isSubmitting: false,
        resultFailureOrSuccessOption:
            some(const Left(Failure.unknownFailure('Unknown Failure'))),
      ),
    ];

    blocTest<NumberBloc, NumberState>(
      'emits a successful changed number when a successful number is entered',
      build: () {
        when(() => mockGetConcreteNumber.call(any()))
            .thenAnswer((_) async => Right(tNumberEntityConcrete));
        numberBloc.add(
            NumberEvent.onNumberChanged(number: tNumberConcrete.toString()));
        return numberBloc;
      },
      act: (bloc) =>
          bloc.add(const NumberEvent.getConcreteNumberButtonPressed()),
      expect: () => (expectedSuccessResponse),
    );
    blocTest<NumberBloc, NumberState>(
      'emits a ServerFailure when a successful number is entered',
      build: () {
        when(() => mockGetConcreteNumber.call(any()))
            .thenAnswer((_) async => const Left(Failure.serverFailure()));
        numberBloc.add(
            NumberEvent.onNumberChanged(number: tNumberConcrete.toString()));
        return numberBloc;
      },
      act: (bloc) =>
          bloc.add(const NumberEvent.getConcreteNumberButtonPressed()),
      expect: () => (expectedServerFailureResponse),
    );
    blocTest<NumberBloc, NumberState>(
      'emits a CacheFailure when a successful number is entered',
      build: () {
        when(() => mockGetConcreteNumber.call(any()))
            .thenAnswer((_) async => const Left(Failure.cacheFailure()));
        numberBloc.add(
            NumberEvent.onNumberChanged(number: tNumberConcrete.toString()));
        return numberBloc;
      },
      act: (bloc) =>
          bloc.add(const NumberEvent.getConcreteNumberButtonPressed()),
      expect: () => (expectedCacheFailureResponse),
    );
    blocTest<NumberBloc, NumberState>(
      'emits a unknownFailure when a successful number is entered',
      build: () {
        when(() => mockGetConcreteNumber.call(any())).thenAnswer(
            (_) async => const Left(Failure.unknownFailure('Unknown Failure')));
        numberBloc.add(
            NumberEvent.onNumberChanged(number: tNumberConcrete.toString()));
        return numberBloc;
      },
      act: (bloc) =>
          bloc.add(const NumberEvent.getConcreteNumberButtonPressed()),
      expect: () => (expectedUnknownFailureResponse),
    );

    /*
      //
  const factory Failure.serverFailure() = ServerFailure;
  const factory Failure.cacheFailure() = CacheFailure;
  //
  
  const factory Failure.unknownFailure(T error) = UnknownFailure;
  
    */
  });
  group('GetRandomNumberButtonPressed', () {
    final expectedResponse = [
      //NumberState.initial(),
      NumberState(
        number: tInputNumberRandom,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: false,
        resultFailureOrSuccessOption: none(),
      ),
      NumberState(
        number: tInputNumberRandom,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: true,
        resultFailureOrSuccessOption: none(),
      ),
      NumberState(
        number: tInputNumberRandom,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.onUserInteraction,
        isSubmitting: false,
        resultFailureOrSuccessOption: some(Right(tNumberEntityRandom)),
      ),
    ];

    final expectedServerFailureResponse = [
      //NumberState.initial(),
      NumberState(
        number: tInputNumberRandom,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: false,
        resultFailureOrSuccessOption: none(),
      ),
      NumberState(
        number: tInputNumberRandom,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: true,
        resultFailureOrSuccessOption: none(),
      ),
      NumberState(
        number: tInputNumberRandom,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.onUserInteraction,
        isSubmitting: false,
        resultFailureOrSuccessOption: some(const Left(Failure.serverFailure())),
      ),
    ];
    final expectedCacheFailureResponse = [
      //NumberState.initial(),
      NumberState(
        number: tInputNumberRandom,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: false,
        resultFailureOrSuccessOption: none(),
      ),
      NumberState(
        number: tInputNumberRandom,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: true,
        resultFailureOrSuccessOption: none(),
      ),
      NumberState(
        number: tInputNumberRandom,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.onUserInteraction,
        isSubmitting: false,
        resultFailureOrSuccessOption: some(const Left(Failure.cacheFailure())),
      ),
    ];
    final expectedUnknownFailureResponse = [
      //NumberState.initial(),
      NumberState(
        number: tInputNumberRandom,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: false,
        resultFailureOrSuccessOption: none(),
      ),
      NumberState(
        number: tInputNumberRandom,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.disabled,
        isSubmitting: true,
        resultFailureOrSuccessOption: none(),
      ),
      NumberState(
        number: tInputNumberRandom,
        text: OutputText(''),
        showErrorMsg: AutovalidateMode.onUserInteraction,
        isSubmitting: false,
        resultFailureOrSuccessOption:
            some(const Left(Failure.unknownFailure('Unknown Failure'))),
      ),
    ];
    blocTest<NumberBloc, NumberState>(
      'emits successful result when sending ',
      build: () {
        when(() => mockGetRandomNumber.call(any()))
            .thenAnswer((_) async => Right(tNumberEntityRandom));
        numberBloc
            .add(NumberEvent.onNumberChanged(number: tNumberRandom.toString()));
        return numberBloc;
      },
      act: (bloc) =>
          bloc.add(const NumberEvent.getRandomNumberButtonPressed()),
      expect: () => (expectedResponse),
    );

    blocTest<NumberBloc, NumberState>(
      'emits a ServerFailure when a successful number is entered',
      build: () {
        when(() => mockGetRandomNumber.call(any()))
            .thenAnswer((_) async => const Left(Failure.serverFailure()));
        numberBloc.add(
            NumberEvent.onNumberChanged(number: tNumberRandom.toString()));
        return numberBloc;
      },
      act: (bloc) =>
          bloc.add(const NumberEvent.getRandomNumberButtonPressed()),
      expect: () => (expectedServerFailureResponse),
    );
    blocTest<NumberBloc, NumberState>(
      'emits a CacheFailure when a successful number is entered',
      build: () {
        when(() => mockGetRandomNumber.call(any()))
            .thenAnswer((_) async => const Left(Failure.cacheFailure()));
        numberBloc.add(
            NumberEvent.onNumberChanged(number: tNumberRandom.toString()));
        return numberBloc;
      },
      act: (bloc) =>
          bloc.add(const NumberEvent.getRandomNumberButtonPressed()),
      expect: () => (expectedCacheFailureResponse),
    );
    blocTest<NumberBloc, NumberState>(
      'emits a unknownFailure when a successful number is entered',
      build: () {
        when(() => mockGetRandomNumber.call(any())).thenAnswer(
            (_) async => const Left(Failure.unknownFailure('Unknown Failure')));
        numberBloc.add(
            NumberEvent.onNumberChanged(number: tNumberRandom.toString()));
        return numberBloc;
      },
      act: (bloc) =>
          bloc.add(const NumberEvent.getRandomNumberButtonPressed()),
      expect: () => (expectedUnknownFailureResponse),
    );

  });
}
