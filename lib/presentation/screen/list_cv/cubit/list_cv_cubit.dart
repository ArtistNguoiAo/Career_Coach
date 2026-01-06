import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/resume_entity.dart';
import 'package:career_coach/domain/use_case/get_list_resume_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'list_cv_state.dart';

class ListCvCubit extends Cubit<ListCvState> {
  ListCvCubit() : super(ListCvState());

  final getListResumeUseCae = getIt<GetListResumeUseCase>();

  Future<void> init() async {
    try {
      final listResume = await getListResumeUseCae.call(
        page: 0,
        size: 10,
        type: '',
      );
      emit(state.copyWith(listResume: listResume));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
