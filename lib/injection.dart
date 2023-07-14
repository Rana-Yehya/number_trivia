import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

//@injectableInit
Future<void> configureInjection(/*String env*/) async{
  getIt.registerFactory(
    () => NumberBloc(
      getConcreteNumber: getIt(), 
      getRandomNumber: getIt()

    ),
  );

  getIt.registerLazySingleton(
    () => GetConcreteNumber(getIt())
  );

  getIt.registerLazySingleton(
    () => GetRandomNumber(getIt())
  );

  getIt.registerLazySingleton<NumberRepository>(
    () => NumberRepositoryImpl(

      numberLocalDataSource: getIt(),
      numberRemoteDataSource: getIt(),
      networkInfo: getIt() 
    ),
  );

  getIt.registerLazySingleton<NumberLocalDataSource>(
    () => NumberLocalDataSourceImpl(sharedPreferences: getIt())
  );

  getIt.registerLazySingleton<NumberRemoteDataSource>(
    () => NumberRemoteDataSourceImpl(httpRequest: getIt())
  );

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt())
  );

  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() =? http.Client());
  getIt.registerLazySingleton(() => DataConnectionChecker());

}
