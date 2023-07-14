import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/number_entity.dart';
import '../repository/number_repository.dart';
import '../entities/number_data_classes.dart';
abstract class GetRandomNumber implements UseCase<NumberEntity, EmptyClass> {
  @override
  Future<Either<Failure, NumberEntity>> call(EmptyClass noParams);
}
class GetRandomNumberImpl implements GetRandomNumber{
  final NumberRepository numberRepository;

  GetRandomNumberImpl(this.numberRepository);

  @override
  Future<Either<Failure, NumberEntity>> call(EmptyClass noParams) async {
    return await numberRepository.getRandomNumber();
  }
}
