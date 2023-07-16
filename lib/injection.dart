import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/network/network_info.dart';
import 'features/number_trivia/domain/repository/number_repository.dart';
import 'features/number_trivia/domain/usecases/get_concrete_number.dart';
import 'features/number_trivia/domain/usecases/get_random_number.dart';
import 'features/number_trivia/infrastructure/datasources/number_local_data_source.dart';
import 'features/number_trivia/infrastructure/datasources/number_remote_data_source.dart';
import 'features/number_trivia/infrastructure/repository/number_repository_impl.dart';
import 'features/number_trivia/presentation/bloc/number_bloc.dart';

final GetIt getIt = GetIt.instance;

//@injectableInit
Future<void> configureInjection(/*String env*/) async {  
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerFactory(
    () => NumberBloc(
      getConcreteNumber: getIt(),
      getRandomNumber: getIt(), // getConcreteNumber: null
    ),
  );

  getIt.registerLazySingleton(() => GetConcreteNumber(getIt()));

  getIt.registerLazySingleton(() => GetRandomNumber(getIt()));

  getIt.registerLazySingleton<NumberRepository>(
    () => NumberRepositoryImpl(
        numberLocalDataSource: getIt(),
        numberRemoteDataSource: getIt(),
        networkInfo: getIt()),
  );

  getIt.registerLazySingleton<NumberLocalDataSource>(
      () => NumberLocalDataSourceImpl(sharedPreferences: getIt()));

  getIt.registerLazySingleton<NumberRemoteDataSource>(
      () => NumberRemoteDataSourceImpl(httpRequest: getIt()));

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));


  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => DataConnectionChecker());
}
