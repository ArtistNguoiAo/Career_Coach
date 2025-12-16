import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/goal_entity.dart';
import 'package:career_coach/domain/use_case/get_goal_use_case.dart';
import 'package:career_coach/domain/use_case/save_goal_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'goal_state.dart';

class GoalCubit extends Cubit<GoalState> {
  GoalCubit() : super(GoalState());

  final getGoalUseCse = getIt<GetGoalUseCase>();
  final saveGoalUseCase = getIt<SaveGoalUseCase>();

  Future<void> init({required int userResumeId}) async {
    await Future.delayed(Duration(milliseconds: 300));
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final goalEntity = await getGoalUseCse(userResumeId: userResumeId);
      emit(state.copyWith(goalEntity: goalEntity, isLoading: false, error: ''));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> save() async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      if(state.goalEntity?.content.isEmpty ?? false) {
        emit(state.copyWith(isLoading: false, error: 'Please fill in all required fields.'));
        return;
      }
      final goalEntity = await saveGoalUseCase.call(
        goalEntity: state.goalEntity!,
      );
      emit(
        state.copyWith(
          goalEntity: goalEntity,
          isLoading: false,
          isSavedSuccess: true,
          error: '',
        ),
      );
      emit(state.copyWith(isSavedSuccess: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
