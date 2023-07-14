import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/core/errors/exceptions.dart';
import 'package:number_trivia/core/errors/failure.dart';
import 'package:number_trivia/core/network/network_info.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_data_classes.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_entity.dart';
import 'package:number_trivia/features/number_trivia/infrastructure/datasources/number_local_data_source.dart';
import 'package:number_trivia/features/number_trivia/infrastructure/datasources/number_remote_data_source.dart';
import 'package:number_trivia/features/number_trivia/infrastructure/models/number_model.dart';
import 'package:number_trivia/features/number_trivia/infrastructure/repository/number_repository_impl.dart';

class MockNumberLocalDataSource extends Mock implements NumberLocalDataSource {}

class MockNumberRemoteDataSource extends Mock
    implements NumberRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}
// class MyTypeFake extends Fake implements MyType {}

void main() {
  late MockNumberLocalDataSource mockNumberLocalDataSource;
  late MockNumberRemoteDataSource mockNumberRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  late NumberRepositoryImpl numberRepo;
  int tNumber = 4;
  InputNumber tInputNumber = InputNumber(tNumber.toString());
  NumberModel tNumberModel = const NumberModel(number: 4, text: 'test');
  NumberEntity tNumberEntity = tNumberModel.toDomain();

  setUpAll(() {
    registerFallbackValue(const NumberModel(number: 4, text: 'test'));
  });

  setUp(() {
    mockNumberLocalDataSource = MockNumberLocalDataSource();
    mockNumberRemoteDataSource = MockNumberRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    numberRepo = NumberRepositoryImpl(
        networkInfo: mockNetworkInfo,
        numberRemoteDataSource: mockNumberRemoteDataSource,
        numberLocalDataSource: mockNumberLocalDataSource);
  });

  test('should check if the device is online', () async {
    when(() => mockNetworkInfo.isConnected)
        .thenAnswer((_) => Future.value(true));

    when(() => mockNumberLocalDataSource.getLocalDataSource())
        .thenAnswer((_) async => tNumberModel);
    when(() => mockNumberLocalDataSource.cacheLocalDataSource(any()))
        .thenAnswer((_) async => false);
    when(() => mockNumberRemoteDataSource.getConcreteNumber(any()))
        .thenAnswer((_) async => tNumberModel);
    when(() => mockNumberRemoteDataSource.getRandomNumber())
        .thenAnswer((_) async => tNumberModel);
    await numberRepo.getRandomNumber();
    verify(() => mockNetworkInfo.isConnected);
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected)
            .thenAnswer((_) => Future.value(true));
      });
      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      body();
    });
  }

  group('getConcreteNumber', () {
    runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        when(() => mockNumberLocalDataSource.getLocalDataSource())
            .thenAnswer((_) async => tNumberModel);
        when(() => mockNumberLocalDataSource.cacheLocalDataSource(any()))
            .thenAnswer((_) async => false);
        when(() => mockNumberRemoteDataSource.getConcreteNumber(any()))
            .thenAnswer((_) async => tNumberModel);

        when(() => mockNumberRemoteDataSource.getRandomNumber())
            .thenAnswer((_) async => tNumberModel);

        final result = await numberRepo.getConcreteNumber(tInputNumber);

        final resultFolded =
            result.fold((failure) => null, (tokenModel) => tokenModel);
        final isEqual = resultFolded!.identical(tNumberEntity);
        verify(() => mockNumberRemoteDataSource.getConcreteNumber(tNumber));
        expect(isEqual, true);
      });
      test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
        when(() => mockNumberLocalDataSource.getLocalDataSource())
            .thenAnswer((_) async => tNumberModel);
        when(() => mockNumberLocalDataSource.cacheLocalDataSource(any()))
            .thenAnswer((_) async => false);
        when(() => mockNumberRemoteDataSource.getConcreteNumber(any()))
            .thenAnswer((_) async => tNumberModel);

        when(() => mockNumberRemoteDataSource.getRandomNumber())
            .thenAnswer((_) async => tNumberModel);
        await numberRepo.getConcreteNumber(tInputNumber);

        verify(() => mockNumberRemoteDataSource.getConcreteNumber(tNumber));
        verify(
            () => mockNumberLocalDataSource.cacheLocalDataSource(tNumberModel));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        when(() => mockNumberRemoteDataSource.getConcreteNumber(any()))
            .thenThrow(ServerErrorException());

        when(() => mockNumberLocalDataSource.getLocalDataSource())
            .thenAnswer((_) async => tNumberModel);
        when(() => mockNumberLocalDataSource.cacheLocalDataSource(any()))
            .thenAnswer((_) async => false);
        when(() => mockNumberRemoteDataSource.getRandomNumber())
            .thenAnswer((_) async => tNumberModel);

        final result = await numberRepo.getConcreteNumber(tInputNumber);
        final resultFolded = result.fold(
          (failure) => failure,
          (tokenModel) => null,
        );
        verify(() => mockNumberRemoteDataSource.getConcreteNumber(tNumber));
        expect(resultFolded, const Failure.serverFailure());
      });
    });
    runTestsOffline(() {
      test(
          'should return last locally cached data when the cached data is present',
          () async {
        when(() => mockNumberLocalDataSource.getLocalDataSource())
            .thenAnswer((_) async => tNumberModel);
        when(() => mockNumberLocalDataSource.cacheLocalDataSource(any()))
            .thenAnswer((_) async => false);
        when(() => mockNumberRemoteDataSource.getConcreteNumber(any()))
            .thenAnswer((_) async => tNumberModel);
        when(() => mockNumberRemoteDataSource.getRandomNumber())
            .thenAnswer((_) async => tNumberModel);

        final result = await numberRepo.getConcreteNumber(tInputNumber);
        final resultFolded =
            result.fold((failure) => null, (tokenModel) => tokenModel);
        final isEqual = resultFolded!.identical(tNumberEntity);
        verifyZeroInteractions(mockNumberRemoteDataSource);
        verify(() => mockNumberLocalDataSource.getLocalDataSource());
        expect(isEqual, true);
      });

      test('should return CacheFailure when there is no cached data present',
          () async {
        when(() => mockNumberLocalDataSource.getLocalDataSource())
            .thenThrow(CacheErrorException());

        when(() => mockNumberLocalDataSource.cacheLocalDataSource(any()))
            .thenAnswer((_) async => false);

        when(() => mockNumberRemoteDataSource.getConcreteNumber(any()))
            .thenAnswer((_) async => tNumberModel);
        when(() => mockNumberRemoteDataSource.getRandomNumber())
            .thenAnswer((_) async => tNumberModel);

        final result = await numberRepo.getConcreteNumber(tInputNumber);

        final resultFolded = result.fold(
          (failure) => failure,
          (tokenModel) => null,
        );
        verifyZeroInteractions(mockNumberRemoteDataSource);
        verify(() => mockNumberLocalDataSource.getLocalDataSource());

        expect(resultFolded, const Failure.cacheFailure());
      });
    });
  });

  group('getRandomNumber', () {
    runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        when(() => mockNumberLocalDataSource.getLocalDataSource())
            .thenAnswer((_) async => tNumberModel);
        when(() => mockNumberLocalDataSource.cacheLocalDataSource(any()))
            .thenAnswer((_) async => false);
        when(() => mockNumberRemoteDataSource.getConcreteNumber(any()))
            .thenAnswer((_) async => tNumberModel);

        when(() => mockNumberRemoteDataSource.getRandomNumber())
            .thenAnswer((_) async => tNumberModel);

        final result = await numberRepo.getRandomNumber();

        final resultFolded =
            result.fold((failure) => null, (tokenModel) => tokenModel);
        final isEqual = resultFolded!.identical(tNumberEntity);
        verify(() => mockNumberRemoteDataSource.getRandomNumber());
        expect(isEqual, true);
      });
      test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
        when(() => mockNumberLocalDataSource.getLocalDataSource())
            .thenAnswer((_) async => tNumberModel);
        when(() => mockNumberLocalDataSource.cacheLocalDataSource(any()))
            .thenAnswer((_) async => false);
        when(() => mockNumberRemoteDataSource.getConcreteNumber(any()))
            .thenAnswer((_) async => tNumberModel);

        when(() => mockNumberRemoteDataSource.getRandomNumber())
            .thenAnswer((_) async => tNumberModel);
        await numberRepo.getRandomNumber();

        verify(() => mockNumberRemoteDataSource.getRandomNumber());
        verify(
            () => mockNumberLocalDataSource.cacheLocalDataSource(tNumberModel));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        when(() => mockNumberRemoteDataSource.getConcreteNumber(any()))
            .thenAnswer((_) async => tNumberModel);

        when(() => mockNumberLocalDataSource.getLocalDataSource())
            .thenAnswer((_) async => tNumberModel);
        when(() => mockNumberLocalDataSource.cacheLocalDataSource(any()))
            .thenAnswer((_) async => false);
        when(() => mockNumberRemoteDataSource.getRandomNumber())
            .thenThrow(ServerErrorException());

        final result = await numberRepo.getRandomNumber();
        final resultFolded = result.fold(
          (failure) => failure,
          (tokenModel) => null,
        );
        verify(() => mockNumberRemoteDataSource.getRandomNumber());
        expect(resultFolded, const Failure.serverFailure());
      });
    });
    runTestsOffline(() {
      test(
          'should return last locally cached data when the cached data is present',
          () async {
        when(() => mockNumberLocalDataSource.getLocalDataSource())
            .thenAnswer((_) async => tNumberModel);
        when(() => mockNumberLocalDataSource.cacheLocalDataSource(any()))
            .thenAnswer((_) async => true);
        when(() => mockNumberRemoteDataSource.getConcreteNumber(any()))
            .thenAnswer((_) async => tNumberModel);
        when(() => mockNumberRemoteDataSource.getRandomNumber())
            .thenAnswer((_) async => tNumberModel);

        final result = await numberRepo.getRandomNumber();
        final resultFolded =
            result.fold((failure) => null, (tokenModel) => tokenModel);
        final isEqual = resultFolded!.identical(tNumberEntity);
        verifyZeroInteractions(mockNumberRemoteDataSource);
        verify(() => mockNumberLocalDataSource.getLocalDataSource());
        expect(isEqual, true);
      });

      test('should return CacheFailure when there is no cached data present',
          () async {
        when(() => mockNumberLocalDataSource.getLocalDataSource())
            .thenThrow(CacheErrorException());

        when(() => mockNumberLocalDataSource.cacheLocalDataSource(any()))
            .thenAnswer((_) async => false);

        when(() => mockNumberRemoteDataSource.getConcreteNumber(any()))
            .thenAnswer((_) async => tNumberModel);
        when(() => mockNumberRemoteDataSource.getRandomNumber())
            .thenAnswer((_) async => tNumberModel);

        final result = await numberRepo.getRandomNumber();

        final resultFolded = result.fold(
          (failure) => failure,
          (tokenModel) => null,
        );
        verifyZeroInteractions(mockNumberRemoteDataSource);
        verify(() => mockNumberLocalDataSource.getLocalDataSource());

        expect(resultFolded, const Failure.cacheFailure());
      });
    });
  });
}
