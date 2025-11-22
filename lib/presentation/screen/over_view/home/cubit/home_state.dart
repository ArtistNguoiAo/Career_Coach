part of 'home_cubit.dart';

class HomeState {
  final List<ResumeEntity> listResume;
  final List<UserResumeRecentEntity> listUserResumeRecent;
  final String error;

  HomeState({
    this.listResume = const [],
    this.listUserResumeRecent = const [],
    this.error = '',
  });

  HomeState copyWith({
    List<ResumeEntity>? listResume,
    List<UserResumeRecentEntity>? listUserResumeRecent,
    String? error,
  }) {
    return HomeState(
      listResume: listResume ?? this.listResume,
      listUserResumeRecent: listUserResumeRecent ?? this.listUserResumeRecent,
      error: error ?? this.error,
    );
  }
}
