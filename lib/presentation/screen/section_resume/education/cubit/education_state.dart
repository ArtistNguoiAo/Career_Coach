part of 'education_cubit.dart';

class EducationState {
  final List<EducationEntity> listEducation;
  String error;
  final bool isLoading;
  final bool isSavedSuccess;

  EducationState({
    this.listEducation = const [],
    this.error = '',
    this.isLoading = false,
    this.isSavedSuccess = false,
  });

  EducationState copyWith({
    List<EducationEntity>? listEducation,
    String? error,
    bool? isLoading,
    bool? isSavedSuccess,
  }) {
    return EducationState(
      listEducation: listEducation ?? this.listEducation,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      isSavedSuccess: isSavedSuccess ?? this.isSavedSuccess,
    );
  }
}
