import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_data_classes.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/number_entity.dart';

import '../../domain/repository/number_repository.dart';
import '../datasources/number_local_data_source.dart';
import '../datasources/number_remote_data_source.dart';
import '../models/number_model.dart';

typedef _ConcreteOrRandom = Future<NumberModel> Function();

class NumberRepositoryImpl extends NumberRepository {
  final NumberLocalDataSource numberLocalDataSource;
  final NumberRemoteDataSource numberRemoteDataSource;
  final NetworkInfo networkInfo;

  NumberRepositoryImpl(
      {required this.numberLocalDataSource,
      required this.numberRemoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, NumberEntity>> getConcreteNumber(
      InputNumber number) async {
    return await _getNumber(() async {
      return await numberRemoteDataSource.getConcreteNumber(int.parse(number.getOrCrash()));
    });
  }

  @override
  Future<Either<Failure, NumberEntity>> getRandomNumber() async {
    return await _getNumber(() {
      return numberRemoteDataSource.getRandomNumber();
    });
  }

  Future<Either<Failure, NumberEntity>> _getNumber(
      _ConcreteOrRandom concreteOrRandom) async {
    final isNetworkOn = await networkInfo.isConnected;
    if (isNetworkOn) {
      try {
        final result = await concreteOrRandom();
        numberLocalDataSource.cacheLocalDataSource(result);
        return Right(result.toDomain());
      } on ServerErrorException {
        return const Left(Failure.serverFailure());
      }
    } else {
      try {
        final result = await numberLocalDataSource.getLocalDataSource();
        return Right(result.toDomain());
      } on CacheErrorException {
        return const Left(Failure.cacheFailure());
      }
    }
  }
}
