part of 'home_cubit.dart';

class HomeState {
  final List<ResumeEntity> listResume;
  final List<UserResumeRecentEntity> listUserResumeRecent;
  final String error;
  final UserEntity? userEntity;

  HomeState({
    this.listResume = const [],
    this.listUserResumeRecent = const [],
    this.error = '',
    this.userEntity,
  });

  HomeState copyWith({
    List<ResumeEntity>? listResume,
    List<UserResumeRecentEntity>? listUserResumeRecent,
    String? error,
    UserEntity? userEntity,
  }) {
    return HomeState(
      listResume: listResume ?? this.listResume,
      listUserResumeRecent: listUserResumeRecent ?? this.listUserResumeRecent,
      error: error ?? this.error,
      userEntity: userEntity ?? this.userEntity,
    );
  }
}
