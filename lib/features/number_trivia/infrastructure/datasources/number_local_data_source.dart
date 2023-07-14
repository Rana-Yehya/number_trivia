import 'package:number_trivia/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/number_model.dart';

abstract class NumberLocalDataSource {
  Future<NumberModel> getLocalDataSource();
  Future<void> cacheLocalDataSource(NumberModel numberModel);
}

class NumberLocalDataSourceImpl extends NumberLocalDataSource {
  final SharedPreferences sharedPreferences;
  final String key = 'TRIVIA_CACHE_DATA';
  NumberLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheLocalDataSource(NumberModel numberModel) {
    return sharedPreferences.setString(
      key,
      json.encode(numberModel.toJson()),
    );
  }

  @override
  Future<NumberModel> getLocalDataSource() {
    final result = sharedPreferences.getString(key);
    if (result != null) {
      return Future.value(NumberModel.fromJson(json.decode(result)));
    } else {
      throw CacheErrorException();
    }
  }
}
