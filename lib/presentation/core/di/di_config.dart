import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/local/local_cache.dart';
import 'package:career_coach/data/remote/auth_remote.dart';
import 'package:career_coach/data/remote/resume_remote.dart';
import 'package:career_coach/data/remote/user_remote.dart';
import 'package:career_coach/data/remote/user_resume_remote.dart';
import 'package:career_coach/data/repository_impl/auth_repository_impl.dart';
import 'package:career_coach/data/repository_impl/resume_repository_impl.dart';
import 'package:career_coach/data/repository_impl/user_repository_impl.dart';
import 'package:career_coach/data/repository_impl/user_resume_repository_impl.dart';
import 'package:career_coach/domain/repository/auth_repository.dart';
import 'package:career_coach/domain/repository/resume_repository.dart';
import 'package:career_coach/domain/repository/user_repository.dart';
import 'package:career_coach/domain/repository/user_resume_repository.dart';
import 'package:career_coach/domain/use_case/create_new_user_resume_copy_use_case.dart';
import 'package:career_coach/domain/use_case/create_new_user_resume_use_case.dart';
import 'package:career_coach/domain/use_case/delete_account_use_case.dart';
import 'package:career_coach/domain/use_case/get_detail_user_resume_use_case.dart';
import 'package:career_coach/domain/use_case/get_list_resume_use_case.dart';
import 'package:career_coach/domain/use_case/get_list_user_resume_recent_use_case.dart';
import 'package:career_coach/domain/use_case/get_list_user_resume_use_case.dart';
import 'package:career_coach/domain/use_case/get_profile_use_case.dart';
import 'package:career_coach/domain/use_case/login_use_case.dart';
import 'package:career_coach/domain/use_case/logout_use_case.dart';
import 'package:career_coach/domain/use_case/register_use_case.dart';
import 'package:career_coach/domain/use_case/google_login_use_case.dart';
import 'package:career_coach/domain/use_case/github_login_use_case.dart';
import 'package:career_coach/domain/use_case/save_user_resume_use_case.dart';
import 'package:career_coach/domain/use_case/update_avatar_use_case.dart';
import 'package:career_coach/domain/use_case/update_profile_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DiConfig {
  static Future<void> init() async {
    // init
    await LocalCache.init();
    getIt.registerLazySingleton<ApiService>(() => ApiService());

    // remote
    getIt.registerLazySingleton<AuthRemote>(() => AuthRemote(getIt.get()));
    getIt.registerLazySingleton<UserRemote>(() => UserRemote(getIt.get()));
    getIt.registerLazySingleton<ResumeRemote>(() => ResumeRemote(getIt.get()));
    getIt.registerLazySingleton<UserResumeRemote>(() => UserResumeRemote(getIt.get()));

    // repository
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt.get()));
    getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(getIt.get()));
    getIt.registerLazySingleton<ResumeRepository>(() => ResumeRepositoryImpl(getIt.get()));
    getIt.registerLazySingleton<UserResumeRepository>(() => UserResumeRepositoryImpl(getIt.get()));

    // use_case
    getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(getIt.get()));
    getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt.get()));
    getIt.registerLazySingleton<GoogleLoginUseCase>(() => GoogleLoginUseCase(getIt.get()));
    getIt.registerLazySingleton<GitHubLoginUseCase>(() => GitHubLoginUseCase(getIt.get()));
    getIt.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(getIt.get()));
    getIt.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(getIt.get()));
    getIt.registerLazySingleton<UpdateAvatarUseCase>(() => UpdateAvatarUseCase(getIt.get()));
    getIt.registerLazySingleton<UpdateProfileUseCase>(() => UpdateProfileUseCase(getIt.get()));
    getIt.registerLazySingleton<DeleteAccountUseCase>(() => DeleteAccountUseCase(getIt.get()));
    getIt.registerLazySingleton<GetListResumeUseCase>(() => GetListResumeUseCase(getIt.get()));
    getIt.registerLazySingleton<GetListUserResumeRecentUseCase>(() => GetListUserResumeRecentUseCase(getIt.get()));
    getIt.registerLazySingleton<CreateNewUserResumeUseCase>(() => CreateNewUserResumeUseCase(getIt.get()));
    getIt.registerLazySingleton<CreateNewUserResumeCopyUseCase>(() => CreateNewUserResumeCopyUseCase(getIt.get()));
    getIt.registerLazySingleton<GetListUserResumeUseCase>(() => GetListUserResumeUseCase(getIt.get()));
    getIt.registerLazySingleton<GetDetailUserResumeUseCase>(() => GetDetailUserResumeUseCase(getIt.get()));
    getIt.registerLazySingleton<SaveUserResumeUseCase>(() => SaveUserResumeUseCase(getIt.get()));

    await getIt.allReady();
  }
}