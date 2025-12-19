import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/avatar_entity.dart';
import 'package:career_coach/domain/use_case/get_avatar_use_case.dart';
import 'package:career_coach/domain/use_case/save_avatar_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'avatar_state.dart';

class AvatarCubit extends Cubit<AvatarState> {
  AvatarCubit() : super(AvatarState());

  final getAvatarUseCase = getIt<GetAvatarUseCase>();
  final saveAvatarUseCase = getIt<SaveAvatarUseCase>();

  Future<void> getAvatar(int userResumeId) async {
    await Future.delayed(Duration(milliseconds: 300));
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final avatar = await getAvatarUseCase.call(userResumeId: userResumeId);
      emit(state.copyWith(avatarEntity: avatar, isLoading: false, error: ''));
    } catch(e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> saveAvatar(int userResumeId, File file) async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final avatar = await saveAvatarUseCase.call(userResumeId: userResumeId, file: file);
      emit(state.copyWith(avatarEntity: avatar, isLoading: false, error: ''));
    } catch(e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }
}
