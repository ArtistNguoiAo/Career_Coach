import 'package:career_coach/data/api_response/base_data_source.dart';
import 'package:career_coach/data/data_source/auth_data_source.dart';
import 'package:career_coach/data/data_source/user_data_soure.dart';
import 'package:career_coach/data/local/local_cache.dart';
import 'package:career_coach/data/repository_impl/auth_repository_impl.dart';
import 'package:career_coach/data/repository_impl/user_repository_impl.dart';
import 'package:career_coach/domain/repository/auth_repository.dart';
import 'package:career_coach/domain/repository/user_repository.dart';
import 'package:career_coach/domain/use_case/get_profile_use_case.dart';
import 'package:career_coach/domain/use_case/login_use_case.dart';
import 'package:career_coach/domain/use_case/logout_use_case.dart';
import 'package:career_coach/domain/use_case/register_use_case.dart';
import 'package:career_coach/domain/use_case/google_login_use_case.dart';
import 'package:career_coach/domain/use_case/github_login_use_case.dart';
import 'package:career_coach/domain/use_case/update_avatar_use_case.dart';
import 'package:career_coach/domain/use_case/update_profile_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DiConfig {
  static Future<void> init() async {
    // init
    await LocalCache.init();
    final baseDataSource = await BaseDataSource.init();
    getIt.registerSingleton<BaseDataSource>(baseDataSource);
    await getIt.allReady();

    // data source
    getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSource(getIt.get()));
    getIt.registerLazySingleton<UserDataSource>(() => UserDataSource(getIt.get()));

    // repository
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt.get()));
    getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(getIt.get()));

    // use_case
    getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(getIt.get()));
    getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt.get()));
    getIt.registerLazySingleton<GoogleLoginUseCase>(() => GoogleLoginUseCase(getIt.get()));
    getIt.registerLazySingleton<GitHubLoginUseCase>(() => GitHubLoginUseCase(getIt.get()));
    getIt.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(getIt.get()));
    getIt.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(getIt.get()));
    getIt.registerLazySingleton<UpdateAvatarUseCase>(() => UpdateAvatarUseCase(getIt.get()));
    getIt.registerLazySingleton<UpdateProfileUseCase>(() => UpdateProfileUseCase(getIt.get()));
  }
}