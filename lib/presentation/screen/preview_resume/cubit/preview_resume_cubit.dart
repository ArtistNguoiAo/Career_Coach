import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/use_case/create_new_user_resume_copy_use_case.dart';
import 'package:career_coach/domain/use_case/create_new_user_resume_use_case.dart';
import 'package:career_coach/domain/use_case/get_detail_user_resume_use_case.dart';
import 'package:career_coach/domain/use_case/get_pdf_use_case.dart';
import 'package:career_coach/domain/use_case/save_user_resume_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'preview_resume_state.dart';

class PreviewResumeCubit extends Cubit<PreviewResumeState> {
  PreviewResumeCubit() : super(PreviewResumeState());

  final createNewUserResumeUseCase = getIt<CreateNewUserResumeUseCase>();
  final createNewUserResumeCopyUseCase = getIt<CreateNewUserResumeCopyUseCase>();
  final getDetailUserResumeUseCase = getIt<GetDetailUserResumeUseCase>();
  final saveUserResumeUseCase = getIt<SaveUserResumeUseCase>();
  final getPdfUseCase = getIt<GetPdfUseCase>();

  Future<void> init({int? resumeId, int? userResumeId, required bool isCreateNew}) async {
    emit(state.copyWith(isLoading: true));
    if (isCreateNew) {
      if (userResumeId == null) {
        final userResumeEntityNew = await createNewUserResumeUseCase(resumeId: resumeId!);
        final userResumeEntity = await getDetailUserResumeUseCase(id: userResumeEntityNew.id);
        final pdfData = await getPdfUseCase(id: userResumeEntityNew.id);
        emit(state.copyWith(userResumeEntity: userResumeEntity, pdfData: pdfData, isLoading: false));
      } else {
        final userResumeEntityNew = await createNewUserResumeCopyUseCase(
          resumeId: resumeId!,
          userResumeId: userResumeId,
        );
        final userResumeEntity = await getDetailUserResumeUseCase(id: userResumeEntityNew.id);
        final pdfData = await getPdfUseCase(id: userResumeEntityNew.id);
        emit(state.copyWith(userResumeEntity: userResumeEntity, pdfData: pdfData, isLoading: false));
      }
    } else {
      final userResumeEntity = await getDetailUserResumeUseCase(id: userResumeId!);
      final pdfData = await getPdfUseCase(id: userResumeId);
      emit(state.copyWith(userResumeEntity: userResumeEntity, pdfData: pdfData, isLoading: false));
    }
  }

  Future<void> saveUserResume({required UserResumeEntity userResumeEntity}) async {
    emit(state.copyWith(isLoading: true));
    if (state.userResumeEntity != null) {
      try {
        await saveUserResumeUseCase.call(
            id: userResumeEntity.id,
            userResumeEntity: userResumeEntity
        );

      }
      catch (e) {
        emit(state.copyWith(error: e.toString(), isLoading: false));
      }
    }
  }

  Future<void> reloadPdf() async {
    emit(state.copyWith(isLoading: true));
    if (state.userResumeEntity != null) {
      try {
        final pdfData = await getPdfUseCase(id: state.userResumeEntity!.id);
        emit(state.copyWith(pdfData: pdfData, isLoading: false));
      }
      catch (e) {
        emit(state.copyWith(error: e.toString(), isLoading: false));
      }
    }
  }
}
