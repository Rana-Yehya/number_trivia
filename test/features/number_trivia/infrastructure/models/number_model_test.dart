import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_data_classes.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_entity.dart';
import 'package:number_trivia/features/number_trivia/infrastructure/models/number_model.dart';
import '../../../../fixtures/fixture_reader.dart';
import 'dart:convert';

void main() {
  NumberModel numberModelDouble =
      NumberModel(number: (1.0).toInt(), text: 'test');
  NumberModel numberModelInt = const NumberModel(number: 1, text: 'test');

  NumberEntity numberEntity =
      NumberEntity(number: InputNumber('1'), text: OutputText('test'));
/*
  test('NumberModel should be a child of Number entity', () async {
    expect(numberModel, isA<NumberE>());
  });
  */
  group('fromJson test', () {
    test('should return response of int value', () {
      //Map<String, dynamic> jsonMockInt = {'text': "Test", 'number': 0};
      final Map<String, dynamic> fixtureResult =
          json.decode(fixture('trivia_int.json'));
      final modelResult = NumberModel.fromJson(fixtureResult);
      expect(modelResult, numberModelInt);
    });
    test('should return response of double value', () {
      //Map<String, dynamic> jsonMockInt = {'text': "Test", 'number': 0};
      final Map<String, dynamic> fixtureResult =
          json.decode(fixture('trivia_double.json'));
      final modelResult = NumberModel.fromJson(fixtureResult);
      expect(modelResult, numberModelDouble);
    });
  });

  group('toJson test', () {
    test('should return response of int value', () {
      final Map<String, dynamic> modelResult = numberModelInt.toJson();
      expect(modelResult, {
        'number': 1,
        'text': 'test',
      });
    });
  });
  group('toDomain test', () {
    test('should return model from entity', () {
      final entityResult = numberModelInt.toDomain();
      //final matching = entityResult == NumberEntity(number: InputNumber('1'), text: OutputText('test'));

      expect(entityResult, isA<NumberEntity>());
      //expect(matching, true);
    });
  });
  group('fromDomain test', () {
    test('should return model from entity', () {
      final modelResult = NumberModel.fromDomain(numberEntity);
      //expect(modelResult, numberModelInt);
      expect(modelResult, isA<NumberModel>());
    });
  });
}
