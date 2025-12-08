import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/activity_entity.dart';
import 'package:career_coach/domain/use_case/get_activities_use_case.dart';
import 'package:career_coach/domain/use_case/save_activities_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit() : super(ActivityState());

  final getActivitiesUseCase = getIt<GetActivitiesUseCase>();
  final saveActivitiesUseCase = getIt<SaveActivitiesUseCase>();

  Future<void> init({required int userResumeId}) async {
    await Future.delayed(Duration(milliseconds: 300));
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final listActivity = await getActivitiesUseCase(userResumeId: userResumeId);
      emit(state.copyWith(listActivity: listActivity, isLoading: false, error: ''));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> save({required int userResumeId}) async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      for (final it in state.listActivity) {
        if (it.organization.trim().isEmpty) {
          emit(state.copyWith(isLoading: false, error: 'Organization cannot be empty.'));
          return;
        }
      }
      await saveActivitiesUseCase.call(
        userResumeId: userResumeId,
        listActivity: state.listActivity,
      );
      final listActivity = await getActivitiesUseCase(userResumeId: userResumeId);
      emit(
        state.copyWith(
          listActivity: listActivity,
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

  Future<void> addActivity() async {
    final newActivity = ActivityEntity(
      id: 0,
      userResumeId: 0,
      displayOrder: state.listActivity.length,
      organization: '',
      position: '',
      startTime: '',
      endTime: '',
      description: '',
    );
    final updatedList = List<ActivityEntity>.from(state.listActivity)..add(newActivity);
    emit(state.copyWith(listActivity: updatedList));
  }

  Future<void> deleteActivity(int index) async {
    final updatedList = List<ActivityEntity>.from(state.listActivity)..removeAt(index);
    for (int i = 0; i < updatedList.length; i++) {
      updatedList[i].displayOrder = i;
    }
    emit(state.copyWith(listActivity: updatedList));
  }

  Future<void> changeActivity(int oldIndex, int newIndex) async {
    if (newIndex < 0 || newIndex >= state.listActivity.length) return;
    final updatedList = List<ActivityEntity>.from(state.listActivity);
    final item = updatedList.removeAt(oldIndex);
    updatedList.insert(newIndex, item);
    for (int i = 0; i < updatedList.length; i++) {
      updatedList[i].displayOrder = i;
    }
    emit(state.copyWith(listActivity: updatedList));
  }
}
