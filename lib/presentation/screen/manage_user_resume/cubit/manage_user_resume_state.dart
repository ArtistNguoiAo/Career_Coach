part of 'manage_user_resume_cubit.dart';

class ManageUserResumeState {
  final List<UserResumeEntity> listUserResume;

  ManageUserResumeState({
    this.listUserResume = const [],
  });

  ManageUserResumeState copyWith({
    List<UserResumeEntity>? listUserResume,
  }) {
    return ManageUserResumeState(
      listUserResume: listUserResume ?? this.listUserResume,
    );
  }
}
