import 'package:dartz/dartz.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/entity/value_object.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';

@immutable
class InputNumber extends ValueObject<String> {
  @override
  final Either<Failure<String>, String> value;

  const InputNumber._({required this.value});

  factory InputNumber(String input) {
    return InputNumber._(
      value: validateInputNumber(input),
    );
  }
}

class OutputText {
  final String value;

  const OutputText._({required this.value});

  factory OutputText(String input) {
    return OutputText._(
      value: input,
    );
  }
}

class EmptyClass {
  const EmptyClass();
}


Either<Failure<String>, String> validateInputNumber(String value) {
  try {
    final intValue = int.parse(value);
    if (intValue >= 0) {
      return Right(value);
    } else {
      throw SmallerThanZeroException();
    }
  } on FormatException catch (_) {
    return Left(Failure.invalidEnteredValueByUser());
  } on SmallerThanZeroException catch (_) {
    return Left(Failure.invalidEnteredValueByUser());
  } catch (e) {
    return Left(Failure.unknownFailure("e.mageess"));
  }
}
