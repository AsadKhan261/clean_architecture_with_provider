import 'package:clean_architecture_with_provider/core/router/app_state.dart';
import 'package:clean_architecture_with_provider/core/services/auth_services.dart';
import 'package:clean_architecture_with_provider/core/services/secure_storage_service.dart';
import 'package:clean_architecture_with_provider/core/services/user_provider.dart';
import 'package:clean_architecture_with_provider/core/utils/globals/globals.dart';
import 'package:clean_architecture_with_provider/core/utils/network/network_info.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/data_sources/auth_remote_data_source.dart';
import 'package:clean_architecture_with_provider/features/authantication/data/repositories/auth_repo_imp.dart';
import 'package:clean_architecture_with_provider/features/authantication/domain/repositories/auth_repo.dart';
import 'package:clean_architecture_with_provider/features/authantication/domain/use_cases/login_usecase.dart';
import 'package:clean_architecture_with_provider/features/authantication/presentation/manager/auth_provider.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<void> onInit() async {
  ///UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  ///Repositories
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(sl()));

  /// External
  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  /// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///Data sources
  sl.registerLazySingleton<AuthRepository>(
      () => LoginRepoImp(networkInfo: sl(), remoteDataSource: sl()));

  ///! Providers
  sl.registerLazySingleton(() => AuthProvider(sl()));
  sl.registerLazySingleton(() => UserProvider());
  sl.registerLazySingleton(() => SecureStorageService());
  sl.registerLazySingleton(() => AuthServices());

  /// Navigator
  sl.registerLazySingleton(() => AppState());
  sl.registerLazySingleton<Dio>(() => Dio());
}
