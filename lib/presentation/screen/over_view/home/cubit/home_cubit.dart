import 'package:bloc/bloc.dart';
import 'package:career_coach/data/exception/api_exception.dart';
import 'package:career_coach/domain/entity/resume_entity.dart';
import 'package:career_coach/domain/use_case/get_list_resume_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  final getListResumeUseCase = getIt<GetListResumeUseCase>();

  Future<void> init() async {
    try {
      final listResume = await getListResumeUseCase.call(
        page: 0,
        size: 5,
        type: '',
      );
      emit(state.copyWith(listResume: listResume));
    } on ApiException catch (e) {
      emit(state.copyWith(error: e.message));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
