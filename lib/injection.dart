import 'package:capstone_apps/data/datasources/covid_remote_data_source.dart';
import 'package:capstone_apps/data/repositories/covid_repository_impl.dart';
import 'package:capstone_apps/domain/repositories/covid_repository.dart';
import 'package:capstone_apps/domain/usecases/get_data_covid.dart';
import 'package:capstone_apps/persentation/providers/covid_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void init() {
  /// Provider
  getIt.registerFactory(
    () => CovidNotifier(
      getDataCovid: getIt(),
    ),
  );

  /// Repository
  getIt.registerLazySingleton<CovidRepository>(
    () => CovidRepositoryImpl(
      covidRemoteDataSource: getIt(),
    ),
  );

  /// Datasource
  getIt.registerLazySingleton<CovidRemoteDataSource>(
    () => CovidRemoteDataSourceImpl(
      client: getIt(),
    ),
  );

  /// Usecase
  getIt.registerLazySingleton(() => GetDataCovid(getIt()));

  /// External
  getIt.registerLazySingleton(() => http.Client());
}
