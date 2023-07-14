import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/core/network/network_info.dart';
import 'package:mocktail/mocktail.dart';
class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}
void main() {
  late MockDataConnectionChecker mockDataConnectionChecker;
  late NetworkInfoImpl networkInfoImpl;
  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test('should return DataConnectionChecker.hasConnection', () async {
      final boolResult = Future.value(true);
      when(() => mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => boolResult);
      final result = networkInfoImpl.isConnected;

      expect(result, boolResult);
      verify(() => mockDataConnectionChecker.hasConnection);
    });
  });
}
