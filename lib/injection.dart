import 'package:capstone_apps/data/datasources/covid_remote_data_source.dart';
import 'package:capstone_apps/data/datasources/location_remote_data_source.dart';
import 'package:capstone_apps/data/repositories/covid_repository_impl.dart';
import 'package:capstone_apps/data/repositories/location_repository_impl.dart';
import 'package:capstone_apps/domain/repositories/covid_repository.dart';
import 'package:capstone_apps/domain/repositories/location_repository.dart';
import 'package:capstone_apps/domain/usecases/get_city.dart';
import 'package:capstone_apps/domain/usecases/get_data_covid.dart';
import 'package:capstone_apps/domain/usecases/get_hospital.dart';
import 'package:capstone_apps/domain/usecases/get_province.dart';
import 'package:capstone_apps/persentation/providers/covid_notifier.dart';
import 'package:capstone_apps/persentation/providers/location_notifier.dart';
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
  getIt.registerFactory(
    () => LocationNotifier(
      getProvince: getIt(),
      getCity: getIt(),
      getHospital: getIt(),
    ),
  );

  /// Repository
  getIt.registerLazySingleton<CovidRepository>(
    () => CovidRepositoryImpl(
      covidRemoteDataSource: getIt(),
    ),
  );
  getIt.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(
      locationRemoteDataSource: getIt(),
    ),
  );

  /// Datasource
  getIt.registerLazySingleton<CovidRemoteDataSource>(
    () => CovidRemoteDataSourceImpl(
      client: getIt(),
    ),
  );
  getIt.registerLazySingleton<LocationRemoteDataSource>(
    () => LocationRemoteDataSourceImpl(
      client: getIt(),
    ),
  );

  /// Usecase
  getIt.registerLazySingleton(() => GetDataCovid(getIt()));
  getIt.registerLazySingleton(() => GetProvince(getIt()));
  getIt.registerLazySingleton(() => GetCity(getIt()));
  getIt.registerLazySingleton(() => GetHospital(getIt()));

  /// External
  getIt.registerLazySingleton(() => http.Client());
}
