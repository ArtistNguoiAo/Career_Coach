part of 'project_cubit.dart';

class ProjectState {
  final List<ProjectEntity> listProject;
  String error;
  final bool isLoading;
  final bool isSavedSuccess;

  ProjectState({
    this.listProject = const [],
    this.error = '',
    this.isLoading = false,
    this.isSavedSuccess = false,
  });

  ProjectState copyWith({
    List<ProjectEntity>? listProject,
    String? error,
    bool? isLoading,
    bool? isSavedSuccess,
  }) {
    return ProjectState(
      listProject: listProject ?? this.listProject,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      isSavedSuccess: isSavedSuccess ?? this.isSavedSuccess,
    );
  }
}
