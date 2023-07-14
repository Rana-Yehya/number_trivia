import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_entity.dart';
import 'package:number_trivia/features/number_trivia/domain/repository/number_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_data_classes.dart';

class MockNumberRepository extends Mock implements NumberRepository {}

void main() {
  late GetConcreteNumber getConcreteNumber;
  late MockNumberRepository mockNumberRepository;

  setUp(() {
    mockNumberRepository = MockNumberRepository();
    getConcreteNumber = GetConcreteNumber(
      numberRepository: mockNumberRepository,
    );
  });
  setUpAll(() {
    registerFallbackValue(InputNumber('1'));
  });
  int tNumber = 20;
  final tNumberEntity = NumberEntity(
      number: InputNumber(tNumber.toString()), text: OutputText('text'));
  test(
      'Should return a number entity class from number repository when calling get concrete number',
      () async {
    when(() => mockNumberRepository.getConcreteNumber(any()))
        .thenAnswer((_) async => Right(tNumberEntity));
    final result = await getConcreteNumber(InputNumber(tNumber.toString()));

    expect(result, Right(tNumberEntity));

    verify(() => mockNumberRepository.getConcreteNumber(tNumberEntity.number));

    verifyNoMoreInteractions(mockNumberRepository);
  });
}
