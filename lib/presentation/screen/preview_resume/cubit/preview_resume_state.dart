part of 'preview_resume_cubit.dart';

class PreviewResumeState {
  UserResumeEntity? userResumeEntity;
  List<int> pdfData;
  bool isLoading;
  String error;

  PreviewResumeState({this.userResumeEntity, this.pdfData = const [], this.isLoading = false, this.error = ''});

  PreviewResumeState copyWith({
    UserResumeEntity? userResumeEntity,
    List<int>? pdfData,
    bool? isLoading,
    String? error,
  }) {
    return PreviewResumeState(
      userResumeEntity: userResumeEntity ?? this.userResumeEntity,
      pdfData: pdfData ?? this.pdfData,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
