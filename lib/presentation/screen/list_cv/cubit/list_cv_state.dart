part of 'list_cv_cubit.dart';

class ListCvState {
  final List<ResumeEntity> listResume;
  String error;
  TypeResumeEnum selectedType;
  final List<UserResumeRecentEntity> listUserResumeRecent;

  ListCvState({
    this.listResume = const [],
    this.error = '',
    this.selectedType = TypeResumeEnum.ALL,
    this.listUserResumeRecent = const [],
  });

  ListCvState copyWith({
    List<ResumeEntity>? listResume,
    String? error,
    TypeResumeEnum? selectedType,
    List<UserResumeRecentEntity>? listUserResumeRecent,
  }) {
    return ListCvState(
      listResume: listResume ?? this.listResume,
      error: error ?? this.error,
      selectedType: selectedType ?? this.selectedType,
      listUserResumeRecent: listUserResumeRecent ?? this.listUserResumeRecent,
    );
  }
}
