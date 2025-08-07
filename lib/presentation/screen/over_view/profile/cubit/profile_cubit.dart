import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:career_coach/data/exception/api_exception.dart';
import 'package:career_coach/data/local/local_cache.dart';
import 'package:career_coach/domain/entity/user_entity.dart';
import 'package:career_coach/domain/use_case/get_profile_use_case.dart';
import 'package:career_coach/domain/use_case/logout_use_case.dart';
import 'package:career_coach/domain/use_case/update_avatar_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final logoutUseCase = getIt<LogoutUseCase>();
  final getProfileUseCase = getIt<GetProfileUseCase>();
  final updateAvatarUseCase = getIt<UpdateAvatarUseCase>();

  Future<void> init() async {
    try {
      final userEntity = await getProfileUseCase.call();
      emit(ProfileLoaded(userEntity: userEntity));
    } on ApiException catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }

  Future<void> updateAvatar(File? avatar) async {
    final currentState = state as ProfileLoaded;
    emit(ProfileLoading());
    try {
      if (avatar == null) {
        emit(ProfileLoaded(userEntity: currentState.userEntity));
        return;
      }
      final userEntity = await updateAvatarUseCase.call(avatar);
      emit(ProfileLoaded(userEntity: userEntity));
    } on ApiException catch (e) {
      emit(ProfileError(error: e.toString()));
      emit(ProfileLoaded(userEntity: currentState.userEntity));
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
