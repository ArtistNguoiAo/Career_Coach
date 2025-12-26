import 'package:bloc/bloc.dart';
import 'package:career_coach/data/exception/api_exception.dart';
import 'package:career_coach/domain/entity/resume_entity.dart';
import 'package:career_coach/domain/entity/user_entity.dart';
import 'package:career_coach/domain/entity/user_resume_recent_entity.dart';
import 'package:career_coach/domain/use_case/get_list_resume_popular_use_case.dart';
import 'package:career_coach/domain/use_case/get_list_user_resume_recent_use_case.dart';
import 'package:career_coach/domain/use_case/get_profile_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  final getListResumePopularUseCase = getIt<GetListResumePopularUseCase>();
  final getListUserResumeRecentUseCae = getIt<GetListUserResumeRecentUseCase>();
  final getProfileUseCase = getIt<GetProfileUseCase>();

  Future<void> init() async {
    try {
      final listResume = await getListResumePopularUseCase.call();
      final listUserResumeRecent = await getListUserResumeRecentUseCae.call(
        limit: 3,
      );
      final userEntity = await getProfileUseCase.call();
      emit(
        state.copyWith(
          listResume: listResume,
          listUserResumeRecent: listUserResumeRecent,
          userEntity: userEntity,
        ),
      );
    } on ApiException catch (e) {
      emit(state.copyWith(error: e.message));
    }
  }
}
