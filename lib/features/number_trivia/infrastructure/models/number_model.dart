import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/number_data_classes.dart';
import '../../domain/entities/number_entity.dart';
part 'number_model.freezed.dart';
part 'number_model.g.dart';

@freezed
class NumberModel with _$NumberModel {
  const NumberModel._();
  const factory NumberModel({
    required String text,
    required int number,
  }) = _NumberModel;

  factory NumberModel.fromJson(Map<String, dynamic> jsonFile) => NumberModel(
        text: jsonFile['text'],
        number: (jsonFile['number'] as num).toInt(),
      );
  factory NumberModel.fromDomain(NumberEntity numberEntity) => NumberModel(
        text: numberEntity.text.value,
        number: int.parse(numberEntity.number.getOrCrash()),
      );
  NumberEntity toDomain() {
    return NumberEntity(
      text: OutputText(text),
      number: InputNumber(number.toString()),
    );
  }

  Map<String, dynamic> toJson() => toJson();
}
