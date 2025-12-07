part of 'skill_cubit.dart';

class SkillState {
  final List<SkillEntity> listSkill;
  final String error;
  final bool isLoading;
  final bool isSavedSuccess;

  SkillState({
    this.listSkill = const [],
    this.error = '',
    this.isLoading = false,
    this.isSavedSuccess = false,
  });

  SkillState copyWith({
    List<SkillEntity>? listSkill,
    String? error,
    bool? isLoading,
    bool? isSavedSuccess,
  }) {
    return SkillState(
      listSkill: listSkill ?? this.listSkill,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      isSavedSuccess: isSavedSuccess ?? this.isSavedSuccess,
    );
  }
}