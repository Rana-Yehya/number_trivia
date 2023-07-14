import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:number_trivia/core/errors/exceptions.dart';
import 'package:number_trivia/features/number_trivia/infrastructure/datasources/number_remote_data_source.dart';
import 'package:number_trivia/features/number_trivia/infrastructure/models/number_model.dart';
import '../../../../fixtures/fixture_reader.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'number_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockHttpClient;
  late NumberRemoteDataSourceImpl numberRemoteDataSourceImpl;

  String response = 'trivia_response.json';
  setUp(() {
    mockHttpClient = MockClient();
    numberRemoteDataSourceImpl =
        NumberRemoteDataSourceImpl(httpRequest: mockHttpClient);
  });

  group('getConcreteNumberTrivia', () {
    const tNumber = 0;
    final tNumberModel = NumberModel.fromJson(json.decode(fixture(response)));
    test(
        'should preform a GET request on a URL with number being the endpoint and with application/json header',
        () async {
      when(mockHttpClient.get(Uri.parse('http://numbersapi.com/$tNumber'),
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture(response), 200));
      numberRemoteDataSourceImpl.getConcreteNumber(tNumber);

      verify(mockHttpClient.get(Uri.parse('http://numbersapi.com/$tNumber'),
          headers: {'Content-Type': 'application/json'}));
    });
    test('should return Number when the response code is 200 (success)',
        () async {
      when(mockHttpClient.get(Uri.parse('http://numbersapi.com/$tNumber'),
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture(response), 200));
      final result =
          await numberRemoteDataSourceImpl.getConcreteNumber(tNumber);
      expect(result, tNumberModel);
    });
    test(
        'should throw a ServerException when the response code is 404 or other',
        () {
      when(mockHttpClient.get(Uri.parse('http://numbersapi.com/$tNumber'),
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('something went wrong', 404));
      final call = numberRemoteDataSourceImpl.getConcreteNumber;
      expect(() => call(tNumber),
          throwsA(const TypeMatcher<ServerErrorException>()));
    });
  });

  group('getRandomNumber', () {
    final tNumberModel = NumberModel.fromJson(json.decode(fixture(response)));
    test(
        'should preform a GET request on a URL with number being the endpoint and with application/json header',
        () {
      when(mockHttpClient.get(Uri.parse('http://numbersapi.com/random'),
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture(response), 200));
      numberRemoteDataSourceImpl.getRandomNumber();

      verify(mockHttpClient.get(Uri.parse('http://numbersapi.com/random'),
          headers: {'Content-Type': 'application/json'}));
    });
    test('should return Number when the response code is 200 (success)',
        () async {
      when(mockHttpClient.get(Uri.parse('http://numbersapi.com/random'),
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture(response), 200));
      final result = await numberRemoteDataSourceImpl.getRandomNumber();
      expect(result, tNumberModel);
    });
    test(
        'should throw a ServerException when the response code is 404 or other',
        () {
      when(mockHttpClient.get(Uri.parse('http://numbersapi.com/random'),
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('something went wrong', 404));
      final call = numberRemoteDataSourceImpl.getRandomNumber;
      expect(() => call(), throwsA(const TypeMatcher<ServerErrorException>()));
    });
  });
}
