import 'dart:core';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/core/errors/exceptions.dart';
import 'package:number_trivia/features/number_trivia/infrastructure/datasources/number_local_data_source.dart';
import 'package:number_trivia/features/number_trivia/infrastructure/models/number_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../fixtures/fixture_reader.dart';
import 'number_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late MockSharedPreferences mockSharedPreferences;
  late NumberLocalDataSourceImpl numberLocalDataSourceImpl;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    numberLocalDataSourceImpl =
        NumberLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });
  String key = 'TRIVIA_CACHE_DATA';
  String response = 'trivia_response.json';
  NumberModel numberModel =
      NumberModel.fromJson(json.decode(fixture(response)));
  group('getLocalDataSource', () {
    test(
        'should return NumberModel from SharedPreferences when there is one in the cache',
        () async {
      when(mockSharedPreferences.getString(any)).thenReturn(fixture(response));

      final result = await numberLocalDataSourceImpl.getLocalDataSource();
      expect(result, numberModel);
      verify(mockSharedPreferences.getString(any));
    });
    test('should throw a CacheException when there is not a cached value',
        () async {
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      final call = numberLocalDataSourceImpl.getLocalDataSource;
      expect(() => call(), throwsA(const TypeMatcher<CacheErrorException>()));
    });
  });
  group('cacheLocalDataSource', () {
    test('should call SharedPreferences to cache the data', () async {
      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((_) async => true);
      await numberLocalDataSourceImpl.cacheLocalDataSource(numberModel);
      final result = json.encode(numberModel.toJson());

      verify(mockSharedPreferences.setString(
        key,
        result,
      ));
    });
  });
}
