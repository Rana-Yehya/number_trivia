import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/number_repository.dart';
import '../entities/number_data_classes.dart';
import '../entities/number_entity.dart';
abstract class GetConcreteNumber extends UseCase<NumberEntity, InputNumber> {

  @override
  Future<Either<Failure, NumberEntity>> call(InputNumber params);
}
class GetConcreteNumberImpl extends GetConcreteNumber {
  final NumberRepository numberRepository;

  GetConcreteNumberImpl(this.numberRepository);
  @override
  Future<Either<Failure, NumberEntity>> call(InputNumber params) async {
    return await numberRepository.getConcreteNumber(params);
  }
}

