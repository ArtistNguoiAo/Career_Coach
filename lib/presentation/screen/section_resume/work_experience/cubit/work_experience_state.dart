part of 'work_experience_cubit.dart';

class WorkExperienceState {
  final List<WorkExperienceEntity> listWorkExperience;
  final String error;
  final bool isLoading;
  final bool isSavedSuccess;

  WorkExperienceState({
    this.listWorkExperience = const [],
    this.error = '',
    this.isLoading = false,
    this.isSavedSuccess = false,
  });

  WorkExperienceState copyWith({
    List<WorkExperienceEntity>? listWorkExperience,
    String? error,
    bool? isLoading,
    bool? isSavedSuccess,
  }) {
    return WorkExperienceState(
      listWorkExperience: listWorkExperience ?? this.listWorkExperience,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      isSavedSuccess: isSavedSuccess ?? this.isSavedSuccess,
    );
  }
}
