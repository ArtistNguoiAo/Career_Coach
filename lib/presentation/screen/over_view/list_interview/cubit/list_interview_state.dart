part of 'list_interview_cubit.dart';

class ListInterviewState {
  final List<InterviewEntity> listInterviewActive;
  final List<InterviewEntity> listInterviewHistory;
  final int currentPageActive;
  final int currentPageHistory;
  final bool hasReachedMaxActive;
  final bool hasReachedMaxHistory;
  final bool isLoading;
  final bool isLoadingMore;
  final int pageSize;
  final List<UserResumeRecentEntity> listUserResumeRecent;
  final bool isSuccess;
  final int sessionId;

  ListInterviewState({
    this.listInterviewActive = const [],
    this.listInterviewHistory = const [],
    this.currentPageActive = 0,
    this.currentPageHistory = 0,
    this.hasReachedMaxActive = false,
    this.hasReachedMaxHistory = false,
    this.isLoading = true,
    this.isLoadingMore = false,
    this.pageSize = 20,
    this.listUserResumeRecent = const [],
    this.isSuccess = false,
    this.sessionId = 0,
  });

  ListInterviewState copyWith({
    List<InterviewEntity>? listInterviewActive,
    List<InterviewEntity>? listInterviewHistory,
    int? currentPageActive,
    int? currentPageHistory,
    bool? hasReachedMaxActive,
    bool? hasReachedMaxHistory,
    bool? isLoading,
    bool? isLoadingMore,
    int? pageSize,
    List<UserResumeRecentEntity>? listUserResumeRecent,
    bool? isSuccess,
    int? sessionId,
  }) {
    return ListInterviewState(
      listInterviewActive: listInterviewActive ?? this.listInterviewActive,
      listInterviewHistory: listInterviewHistory ?? this.listInterviewHistory,
      currentPageActive: currentPageActive ?? this.currentPageActive,
      currentPageHistory: currentPageHistory ?? this.currentPageHistory,
      hasReachedMaxActive: hasReachedMaxActive ?? this.hasReachedMaxActive,
      hasReachedMaxHistory: hasReachedMaxHistory ?? this.hasReachedMaxHistory,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      pageSize: pageSize ?? this.pageSize,
      listUserResumeRecent: listUserResumeRecent ?? this.listUserResumeRecent,
      isSuccess: isSuccess ?? this.isSuccess,
      sessionId: sessionId ?? this.sessionId,
    );
  }
}
