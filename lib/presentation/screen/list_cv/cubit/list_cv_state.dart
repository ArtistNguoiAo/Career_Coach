part of 'list_cv_cubit.dart';

class ListCvState {
  final List<ResumeEntity> listResume;
  String error;

  ListCvState({
    this.listResume = const [],
    this.error = '',
  });

  ListCvState copyWith({
    List<ResumeEntity>? listResume,
    String? error,
  }) {
    return ListCvState(
      listResume: listResume ?? this.listResume,
      error: error ?? this.error,
    );
  }
}
