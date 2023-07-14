import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/number_data_classes.dart';
import '../entities/number_entity.dart';

abstract class NumberRepository {
  Future<Either<Failure, NumberEntity>> getConcreteNumber(InputNumber number);
  Future<Either<Failure, NumberEntity>> getRandomNumber();
}
