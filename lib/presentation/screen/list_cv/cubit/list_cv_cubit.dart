import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/resume_entity.dart';
import 'package:career_coach/domain/entity/user_resume_recent_entity.dart';
import 'package:career_coach/domain/enum/type_resume_enum.dart';
import 'package:career_coach/domain/use_case/get_list_resume_use_case.dart';
import 'package:career_coach/domain/use_case/get_list_user_resume_recent_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'list_cv_state.dart';

class ListCvCubit extends Cubit<ListCvState> {
  ListCvCubit() : super(ListCvState());

  final getListResumeUseCae = getIt<GetListResumeUseCase>();
  final getListUserResumeRecentUseCae = getIt<GetListUserResumeRecentUseCase>();

  Future<void> init({required TypeResumeEnum? typeResumeEnum}) async {
    try {
      final listUserResumeRecent = await getListUserResumeRecentUseCae.call(limit: 5);
      final listResume = await getListResumeUseCae.call(
        page: 0,
        size: 10,
        type: (typeResumeEnum?.name ?? '') != TypeResumeEnum.ALL.name ? typeResumeEnum!.name : '',
      );
      emit(
        state.copyWith(
          listResume: listResume,
          error: '',
          selectedType: typeResumeEnum,
          listUserResumeRecent: listUserResumeRecent,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
