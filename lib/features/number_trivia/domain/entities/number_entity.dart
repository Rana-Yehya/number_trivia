import 'package:freezed_annotation/freezed_annotation.dart';
import 'number_data_classes.dart';
part 'number_entity.freezed.dart';
@freezed
abstract class NumberEntity with _$NumberEntity {
  const factory NumberEntity({
    required InputNumber number,
    required OutputText text,
  }) = _NumberEntity;

  factory NumberEntity.empty() => NumberEntity(
    number: InputNumber('0'),
    text: OutputText('Please enter any positvie number or zero'),
  );
  const NumberEntity._();

  bool identical(NumberEntity other) {
    return (other.number == number && other.text.value == text.value);
  }
}