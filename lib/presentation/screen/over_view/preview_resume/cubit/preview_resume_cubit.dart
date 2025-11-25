import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/use_case/create_new_user_resume_copy_use_case.dart';
import 'package:career_coach/domain/use_case/create_new_user_resume_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'preview_resume_state.dart';

class PreviewResumeCubit extends Cubit<PreviewResumeState> {
  PreviewResumeCubit() : super(PreviewResumeState());

  final createNewUserResumeUseCase = getIt<CreateNewUserResumeUseCase>();
  final createNewUserResumeCopyUseCase = getIt<CreateNewUserResumeCopyUseCase>();

  Future<void> init({
    required int resumeId,
    int? userResumeId,
  }) async {
    if(userResumeId == null) {
      final userResumeEntity = await createNewUserResumeUseCase(
        resumeId: resumeId,
      );
      emit(state.copyWith(userResumeEntity: userResumeEntity));
    } else {
      final userResumeEntity = await createNewUserResumeCopyUseCase(
        resumeId: resumeId,
        userResumeId: userResumeId,
      );
      emit(state.copyWith(userResumeEntity: userResumeEntity));
    }
  }
}
