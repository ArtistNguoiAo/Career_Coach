import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/work_experience_entity.dart';
import 'package:career_coach/domain/use_case/get_work_experiences_use_case.dart';
import 'package:career_coach/domain/use_case/save_work_experiences_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'work_experience_state.dart';

class WorkExperienceCubit extends Cubit<WorkExperienceState> {
  WorkExperienceCubit() : super(WorkExperienceState());

  final getWorkExperiencesUseCase = getIt<GetWorkExperiencesUseCase>();
  final saveWorkExperiencesUseCase = getIt<SaveWorkExperiencesUseCase>();

  Future<void> init({required int userResumeId}) async {
    await Future.delayed(Duration(milliseconds: 300));
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final listWorkExperience = await getWorkExperiencesUseCase(userResumeId: userResumeId);
      emit(state.copyWith(listWorkExperience: listWorkExperience, isLoading: false, error: ''));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> save({required int userResumeId}) async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      for (final it in state.listWorkExperience) {
        if (it.company.trim().isEmpty) {
          emit(state.copyWith(isLoading: false, error: 'Company cannot be empty.'));
          return;
        }
      }
      await saveWorkExperiencesUseCase.call(userResumeId: userResumeId, listWorkExperience: state.listWorkExperience);
      final listWorkExperience = await getWorkExperiencesUseCase(userResumeId: userResumeId);
      emit(state.copyWith(listWorkExperience: listWorkExperience, isLoading: false, isSavedSuccess: true, error: ''));
      emit(state.copyWith(isSavedSuccess: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> addWorkExperience() async {
    final newWorkExperience = WorkExperienceEntity(
      id: 0,
      userResumeId: 0,
      displayOrder: state.listWorkExperience.length,
      company: '',
      position: '',
      startTime: '',
      endTime: '',
      description: '',
    );
    final updatedList = List<WorkExperienceEntity>.from(state.listWorkExperience)..add(newWorkExperience);
    emit(state.copyWith(listWorkExperience: updatedList));
  }

  Future<void> deleteWorkExperience(int index) async {
    final updatedList = List<WorkExperienceEntity>.from(state.listWorkExperience)..removeAt(index);
    emit(state.copyWith(listWorkExperience: updatedList));
  }

  Future<void> changeWorkExperience(int oldIndex, int newIndex) async {
    if (newIndex < 0 || newIndex >= state.listWorkExperience.length) return;
    final updatedList = List<WorkExperienceEntity>.from(state.listWorkExperience);
    final item = updatedList.removeAt(oldIndex);
    updatedList.insert(newIndex, item);
    for (int i = 0; i < updatedList.length; i++) {
      updatedList[i].displayOrder = i;
    }
    emit(state.copyWith(listWorkExperience: updatedList));
  }
}
