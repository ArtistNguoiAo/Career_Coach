part of 'list_interview_cubit.dart';

class ListInterviewState {
  final List<InterviewEntity> listInterviewActive;
  final List<InterviewEntity> listInterviewHistory;

  ListInterviewState({
    this.listInterviewActive = const [],
    this.listInterviewHistory = const [],
  });

  ListInterviewState copyWith({
    List<InterviewEntity>? listInterviewActive,
    List<InterviewEntity>? listInterviewHistory,
  }) {
    return ListInterviewState(
      listInterviewActive: listInterviewActive ?? this.listInterviewActive,
      listInterviewHistory: listInterviewHistory ?? this.listInterviewHistory,
    );
  }
}
