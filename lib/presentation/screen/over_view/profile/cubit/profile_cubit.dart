import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:career_coach/data/exception/api_exception.dart';
import 'package:career_coach/data/local/local_cache.dart';
import 'package:career_coach/domain/entity/user_entity.dart';
import 'package:career_coach/domain/use_case/delete_account_use_case.dart';
import 'package:career_coach/domain/use_case/get_profile_use_case.dart';
import 'package:career_coach/domain/use_case/logout_use_case.dart';
import 'package:career_coach/domain/use_case/update_avatar_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState());

  final logoutUseCase = getIt<LogoutUseCase>();
  final getProfileUseCase = getIt<GetProfileUseCase>();
  final updateAvatarUseCase = getIt<UpdateAvatarUseCase>();
  final deleteAccountUseCase = getIt<DeleteAccountUseCase>();

  Future<void> init() async {
    try {
      final userEntity = await getProfileUseCase.call();
      emit(state.copyWith(userEntity: userEntity));
    }
    on ApiException catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> updateAvatar(File? avatar) async {
    try {
      if (avatar == null) {
        return;
      }
      final userEntity = await updateAvatarUseCase.call(avatar);
      emit(state.copyWith(userEntity: userEntity));
    }
    on ApiException catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      final refreshToken = await LocalCache.getString(StringCache.refreshToken);
      await logoutUseCase.call(refreshToken: refreshToken);
      await LocalCache.setBool(StringCache.isLoggedIn, false);
      await LocalCache.setString(StringCache.accessToken, '');
      await LocalCache.setString(StringCache.refreshToken, '');
      emit(state.copyWith(isLogoutSuccess: true));
    }
    on ApiException catch (e){
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> deleteAccount() async {
    try {
      await deleteAccountUseCase.call();
      await LocalCache.clear();
      emit(state.copyWith(isDeleteAccountSuccess: true));
    }
    on ApiException catch (e){
      emit(state.copyWith(error: e.toString()));
    }
  }
}
