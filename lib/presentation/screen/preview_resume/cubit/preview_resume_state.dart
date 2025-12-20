part of 'preview_resume_cubit.dart';

class PreviewResumeState {
  UserResumeEntity? userResumeEntity;
  List<int> pdfData;

  PreviewResumeState({this.userResumeEntity, this.pdfData = const []});

  PreviewResumeState copyWith({UserResumeEntity? userResumeEntity, List<int>? pdfData}) {
    return PreviewResumeState(
      userResumeEntity: userResumeEntity ?? this.userResumeEntity,
      pdfData: pdfData ?? this.pdfData
    );
  }
}
