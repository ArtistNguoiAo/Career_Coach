part of 'manage_user_resume_cubit.dart';

class ManageUserResumeState {
  final List<UserResumeEntity> listUserResumeSaved;
  final List<UserResumeEntity> listUserResumeDraft;
  final int currentPageSaved;
  final int currentPageDraft;
  final bool hasReachedMaxSaved;
  final bool hasReachedMaxDraft;
  final bool isLoading;
  final bool isLoadingMore;
  final int pageSize;
  String error;
  bool isDeleteSuccess;

  ManageUserResumeState({
    this.listUserResumeSaved = const [],
    this.listUserResumeDraft = const [],
    this.currentPageSaved = 0,
    this.currentPageDraft = 0,
    this.hasReachedMaxSaved = false,
    this.hasReachedMaxDraft = false,
    this.isLoading = true,
    this.isLoadingMore = false,
    this.pageSize = 20,
    this.error = '',
    this.isDeleteSuccess = false,
  });

  ManageUserResumeState copyWith({
    List<UserResumeEntity>? listUserResumeSaved,
    List<UserResumeEntity>? listUserResumeDraft,
    int? currentPageSaved,
    int? currentPageDraft,
    bool? hasReachedMaxSaved,
    bool? hasReachedMaxDraft,
    bool? isLoading,
    bool? isLoadingMore,
    int? pageSize,
    String? error,
    bool? isDeleteSuccess,
  }) {
    return ManageUserResumeState(
      listUserResumeSaved: listUserResumeSaved ?? this.listUserResumeSaved,
      listUserResumeDraft: listUserResumeDraft ?? this.listUserResumeDraft,
      currentPageSaved: currentPageSaved ?? this.currentPageSaved,
      currentPageDraft: currentPageDraft ?? this.currentPageDraft,
      hasReachedMaxSaved: hasReachedMaxSaved ?? this.hasReachedMaxSaved,
      hasReachedMaxDraft: hasReachedMaxDraft ?? this.hasReachedMaxDraft,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      pageSize: pageSize ?? this.pageSize,
      error: error ?? this.error,
      isDeleteSuccess: isDeleteSuccess ?? this.isDeleteSuccess,
    );
  }
}
