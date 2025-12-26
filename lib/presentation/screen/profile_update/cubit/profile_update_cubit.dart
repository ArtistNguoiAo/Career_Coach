import 'package:bloc/bloc.dart';
import 'package:career_coach/data/exception/api_exception.dart';
import 'package:career_coach/domain/entity/user_entity.dart';
import 'package:career_coach/domain/use_case/update_profile_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';
part 'profile_update_state.dart';

class ProfileUpdateCubit extends Cubit<ProfileUpdateState> {
  ProfileUpdateCubit() : super(ProfileUpdateState());

  final updateProfileUseCase = getIt<UpdateProfileUseCase>();

  Future<void> init(UserEntity userEntity) async {
    await Future.delayed(const Duration(milliseconds: 500));
    emit(state.copyWith(userEntity: userEntity));
  }

  Future<void> updateProfile({
    required String fullName,
    required String email,
    required String phone,
  }) async {
    emit(state.copyWith(isLoading: true));
    try {
      final updatedUser = await updateProfileUseCase.call(
        fullName: fullName,
        email: email,
        phone: phone,
      );
      emit(state.copyWith(userEntity: updatedUser, isLoading: false, isUpdateSuccess: true));
    }
    on ApiException catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }
}
