import 'package:capstone_apps/data/datasources/auth_remote_data_source.dart';
import 'package:capstone_apps/data/datasources/covid_remote_data_source.dart';
import 'package:capstone_apps/data/datasources/db/database_helper.dart';
import 'package:capstone_apps/data/datasources/location_remote_data_source.dart';
import 'package:capstone_apps/data/datasources/news_local_remote_data_source.dart';
import 'package:capstone_apps/data/datasources/news_remote_data_source.dart';
import 'package:capstone_apps/data/repositories/auth_repository_impl.dart';
import 'package:capstone_apps/data/repositories/covid_repository_impl.dart';
import 'package:capstone_apps/data/repositories/location_repository_impl.dart';
import 'package:capstone_apps/data/repositories/news_repository_impl.dart';
import 'package:capstone_apps/domain/repositories/auth_repository.dart';
import 'package:capstone_apps/domain/repositories/covid_repository.dart';
import 'package:capstone_apps/domain/repositories/location_repository.dart';
import 'package:capstone_apps/domain/repositories/news_repository.dart';
import 'package:capstone_apps/domain/usecases/get_bookmark.dart';
import 'package:capstone_apps/domain/usecases/get_bookmark_status.dart';
import 'package:capstone_apps/domain/usecases/get_city.dart';
import 'package:capstone_apps/domain/usecases/get_data_covid.dart';
import 'package:capstone_apps/domain/usecases/get_hospital.dart';
import 'package:capstone_apps/domain/usecases/get_hospital_id.dart';
import 'package:capstone_apps/domain/usecases/get_map_hospital.dart';
import 'package:capstone_apps/domain/usecases/get_news.dart';
import 'package:capstone_apps/domain/usecases/get_province.dart';
import 'package:capstone_apps/domain/usecases/remove_bookmark.dart';
import 'package:capstone_apps/domain/usecases/save_bookmark.dart';
import 'package:capstone_apps/domain/usecases/sign_in_user.dart';
import 'package:capstone_apps/domain/usecases/sign_up_user.dart';
import 'package:capstone_apps/persentation/providers/auth_notifer.dart';
import 'package:capstone_apps/persentation/providers/covid_notifier.dart';
import 'package:capstone_apps/persentation/providers/location_notifier.dart';
import 'package:capstone_apps/persentation/providers/news_notifier.dart';
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
    () => NewsNotifier(
      getNews: getIt(),
      saveBookmark: getIt(),
      getBookmark: getIt(),
      getBookmarkStatus: getIt(),
      removeBookmark: getIt(),
    ),
  );
  getIt.registerFactory(
    () => LocationNotifier(
      getProvince: getIt(),
      getCity: getIt(),
      getHospital: getIt(),
      getDetailHospital: getIt(),
      getMapHospital: getIt(),
    ),
  );
  getIt.registerFactory(
    () => AuthNotifer(
      signInUser: getIt(),
      signUpUser: getIt(),
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
  getIt.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      newsRemoteDataSource: getIt(),
      newsLocalDataSource: getIt(),
    ),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemotDataSource: getIt(),
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
  getIt.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(
      client: getIt(),
    ),
  );
  getIt.registerLazySingleton<NewsLocalDataSource>(
    () => NewsLocalDataSourceImpl(
      databaseHelper: getIt(),
    ),
  );
  getIt.registerLazySingleton<AuthRemotDataSource>(
    () => AuthRemotDataSourceImpl(),
  );

  /// Usecase
  getIt.registerLazySingleton(() => GetDataCovid(getIt()));
  getIt.registerLazySingleton(() => GetProvince(getIt()));
  getIt.registerLazySingleton(() => GetCity(getIt()));
  getIt.registerLazySingleton(() => GetHospital(getIt()));
  getIt.registerLazySingleton(() => GetDetailHospital(getIt()));
  getIt.registerLazySingleton(() => GetMapHospital(getIt()));
  getIt.registerLazySingleton(() => GetNews(getIt()));
  getIt.registerLazySingleton(() => SaveBookmark(getIt()));
  getIt.registerLazySingleton(() => GetBookmark(getIt()));
  getIt.registerLazySingleton(() => GetBookmarkStatus(getIt()));
  getIt.registerLazySingleton(() => RemoveBookmark(getIt()));
  getIt.registerLazySingleton(() => SignInUser(getIt()));
  getIt.registerLazySingleton(() => SignUpUser(getIt()));

  ///Helper
  getIt.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  /// External
  getIt.registerLazySingleton(() => http.Client());
}
