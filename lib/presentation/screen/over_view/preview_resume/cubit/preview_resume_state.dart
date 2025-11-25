part of 'preview_resume_cubit.dart';

class PreviewResumeState {
  final UserResumeEntity? userResumeEntity;

  PreviewResumeState({this.userResumeEntity});

  PreviewResumeState copyWith({UserResumeEntity? userResumeEntity}) {
    return PreviewResumeState(
      userResumeEntity: userResumeEntity ?? this.userResumeEntity,
    );
  }
}
