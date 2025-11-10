import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/use_case/get_list_resume_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  final getListResumeUseCase = getIt<GetListResumeUseCase>();

  Future<void> init() async {
    try {
      final resumes = await getListResumeUseCase.call(
        page: 0,
        size: 10,
        type: '',
      );

    } catch (e) {

    }
  }
}
