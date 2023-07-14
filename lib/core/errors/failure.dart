import 'package:freezed_annotation/freezed_annotation.dart';
part 'failure.freezed.dart';
@freezed
abstract class Failure<T> with _$Failure<T>{
  //
  const factory Failure.serverFailure() = ServerFailure;
  const factory Failure.cacheFailure() = CacheFailure;
  //
  const factory Failure.invalidEnteredValueByUser() = InvalidEnteredValueByUser;
  const factory Failure.unknownFailure(T error) = UnknownFailure;
}
