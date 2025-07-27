import 'package:bloc/bloc.dart';
import 'package:career_coach/data/api_response/api_exception.dart';
import 'package:career_coach/data/local/local_cache.dart';
import 'package:career_coach/domain/use_case/logout_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final logoutUseCase = getIt<LogoutUseCase>();

  Future<void> init() async {
    try {
      print('TrungLQ: ProfileCubit init called');
      final refreshToken = await LocalCache.getString(StringCache.refreshToken);
      if (refreshToken.isEmpty) {
        emit(ProfileError(error: 'No refresh token found'));
      } else {
        emit(ProfileLoaded());
      }
    } on ApiException catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      final refreshToken = await LocalCache.getString(StringCache.refreshToken);
      await logoutUseCase.call(refreshToken: refreshToken);
      emit(ProfileLogoutSuccess());
    } on ApiException catch (e){
      emit(ProfileError(error: e.toString()));
    }
  }
}
