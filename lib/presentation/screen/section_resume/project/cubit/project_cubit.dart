import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/project_entity.dart';
import 'package:career_coach/domain/use_case/get_projects_use_case.dart';
import 'package:career_coach/domain/use_case/save_projects_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit() : super(ProjectState());

  final getProjectsUseCase = getIt<GetProjectsUseCase>();
  final saveProjectsUseCase = getIt<SaveProjectsUseCase>();

  Future<void> init({required int userResumeId}) async {
    await Future.delayed(Duration(milliseconds: 300));
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final listProject = await getProjectsUseCase(userResumeId: userResumeId);
      emit(state.copyWith(listProject: listProject, isLoading: false, error: ''));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> save({required int userResumeId}) async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      for (final it in state.listProject) {
        if (it.name.trim().isEmpty) {
          emit(state.copyWith(isLoading: false, error: 'Project name cannot be empty.'));
          return;
        }
      }
      await saveProjectsUseCase.call(
        userResumeId: userResumeId,
        listProject: state.listProject,
      );
      final listProject = await getProjectsUseCase(userResumeId: userResumeId);
      emit(
        state.copyWith(
          listProject: listProject,
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

  Future<void> addProject() async {
    final newProject = ProjectEntity(
      id: 0,
      userResumeId: 0,
      displayOrder: state.listProject.length,
      name: '',
      position: '',
      startTime: '',
      endTime: '',
      description: '',
    );
    final updatedList = List<ProjectEntity>.from(state.listProject)..add(newProject);
    emit(state.copyWith(listProject: updatedList));
  }

  Future<void> deleteProject(int index) async {
    final updatedList = List<ProjectEntity>.from(state.listProject)..removeAt(index);
    for (int i = 0; i < updatedList.length; i++) {
      updatedList[i].displayOrder = i;
    }
    emit(state.copyWith(listProject: updatedList));
  }

  Future<void> changeProject(int oldIndex, int newIndex) async {
    if (newIndex < 0 || newIndex >= state.listProject.length) return;
    final updatedList = List<ProjectEntity>.from(state.listProject);
    final item = updatedList.removeAt(oldIndex);
    updatedList.insert(newIndex, item);
    for (int i = 0; i < updatedList.length; i++) {
      updatedList[i].displayOrder = i;
    }
    emit(state.copyWith(listProject: updatedList));
  }
}
