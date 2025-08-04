import 'package:bloc/bloc.dart';
import 'package:career_coach/data/api_response/api_exception.dart';
import 'package:career_coach/data/local/local_cache.dart';
import 'package:career_coach/domain/entity/user_entity.dart';
import 'package:career_coach/domain/use_case/get_profile_use_case.dart';
import 'package:career_coach/domain/use_case/logout_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final logoutUseCase = getIt<LogoutUseCase>();
  final getProfileUseCase = getIt<GetProfileUseCase>();

  Future<void> init() async {
    try {
      final userEntity = await getProfileUseCase.call();
      emit(ProfileLoaded(userEntity: userEntity));
    } on ApiException catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      final refreshToken = await LocalCache.getString(StringCache.refreshToken);
      await logoutUseCase.call(refreshToken: refreshToken);
      await LocalCache.setBool(StringCache.isLoggedIn, false);
      emit(ProfileLogoutSuccess());
    } on ApiException catch (e){
      emit(ProfileError(error: e.toString()));
    }
  }
}
