import 'dart:convert';

import 'package:number_trivia/core/errors/exceptions.dart';

import '../models/number_model.dart';
import 'package:http/http.dart' as http;

abstract class NumberRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.

  Future<NumberModel> getConcreteNumber(int number);

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.

  Future<NumberModel> getRandomNumber();
}

class NumberRemoteDataSourceImpl extends NumberRemoteDataSource {
  final http.Client httpRequest;

  NumberRemoteDataSourceImpl({required this.httpRequest});

  @override
  Future<NumberModel> getConcreteNumber(int number) {
    return _getDataFromUrl('http://numbersapi.com/$number?json');
  }

  @override
  Future<NumberModel> getRandomNumber() {
    return _getDataFromUrl('http://numbersapi.com/random?json');
  }

  Future<NumberModel> _getDataFromUrl(String url) async {
    final response = await httpRequest.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return NumberModel.fromJson(json.decode(response.body));
    } else {
      throw ServerErrorException();
    }
  }
}
