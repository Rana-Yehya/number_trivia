import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_entity.dart';
import 'package:number_trivia/features/number_trivia/domain/repository/number_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_number.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_data_classes.dart';

class MockNumberRepository extends Mock implements NumberRepository {}

void main() {
  late MockNumberRepository mockNumberRepository;
  late GetRandomNumber getRandomNumber;

  setUp(() {
    mockNumberRepository = MockNumberRepository();
    getRandomNumber = GetRandomNumber(mockNumberRepository);
  });
  int tNumber = 20;
  final tNumberEntity = NumberEntity(
      number: InputNumber(tNumber.toString()), text: OutputText('text'));

  test('should get  from the repository', () async {
    when(() => mockNumberRepository.getRandomNumber())
        .thenAnswer((_) async => Right(tNumberEntity));

    final result = await getRandomNumber(EmptyClass());
    expect(result, Right(tNumberEntity));
    verify(() => mockNumberRepository.getRandomNumber());
    verifyNoMoreInteractions(mockNumberRepository);
  });
}
