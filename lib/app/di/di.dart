import 'package:dio/dio.dart';
import 'package:food_hub/core/network/api_service.dart';
import 'package:food_hub/core/network/hive_service.dart';
import 'package:food_hub/features/auth/data/data_source/local_datasource/local_datasource.dart';
import 'package:food_hub/features/auth/data/data_source/remote_datasource/remote_datasource.dart';
import 'package:food_hub/features/auth/data/repository/auth_local_repository.dart';
import 'package:food_hub/features/auth/data/repository/auth_remote_repository.dart';
import 'package:food_hub/features/auth/domain/use_case/signup_use_case.dart';
import 'package:food_hub/features/auth/presentation/view_model/login/bloc/login_bloc.dart';
import 'package:food_hub/features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';
import 'package:food_hub/features/splash/presentation/view_model/cubit/splash_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();
  await _initApiService();
  await _initSignupDependencies();
  await _initLoginDependencies();
  await _initSplashDependencies();
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initApiService() {
  //remote data souce
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

_initSignupDependencies() async {
  getIt.registerLazySingleton(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  // init local repository
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );

  // register use usecase
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  //Upload image use case
  // getIt.registerLazySingleton<UploadImageUsecase>(
  //   () => UploadImageUsecase(
  //     getIt<AuthRemoteRepository>(),
  //   ),
  // );

  getIt.registerFactory<SignupBloc>(
    () => SignupBloc(
      registerUseCase: getIt(),
    ),
  );

  //Remote data source
  getIt.registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(getIt<Dio>()));

  //Repo Remotre
  getIt.registerLazySingleton<AuthRemoteRepository>(
      () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()));

  // getIt.registerFactory<SignupBloc>(
  //   () => SignupBloc(
  //     loginBloc: getIt<LoginBloc>(),
  //     registerUseCase: getIt(),
  //   ),
  // );

  //Remote data sourc
}

_initLoginDependencies() async {
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      signupBloc: getIt<SignupBloc>(),
    ),
  );
}

_initSplashDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<SignupBloc>()),
  );
}
