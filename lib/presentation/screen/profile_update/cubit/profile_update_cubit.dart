import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/user_entity.dart';
import 'package:career_coach/domain/use_case/update_profile_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';
import 'package:meta/meta.dart';

part 'profile_update_state.dart';

class ProfileUpdateCubit extends Cubit<ProfileUpdateState> {
  ProfileUpdateCubit() : super(ProfileUpdateInitial());

  final updateProfileUseCase = getIt<UpdateProfileUseCase>();

  Future<void> init(UserEntity userEntity) async {
    await Future.delayed(const Duration(milliseconds: 500));
    emit(ProfileUpdateLoaded(userEntity: userEntity));
  }

  Future<void> updateProfile({
    required String fullName,
    required String email,
    required String phone,
  }) async {
    emit(ProfileUpdateLoading());
    try {
      final updatedUser = await updateProfileUseCase.call(
        fullName: fullName,
        email: email,
        phone: phone,
      );
      emit(ProfileUpdateSuccess());
      emit(ProfileUpdateLoaded(userEntity: updatedUser));
    } catch (e) {
      emit(ProfileUpdateError(message: e.toString()));
    }
  }
}
