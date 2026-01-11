part of 'profile_cubit.dart';

class ProfileState {
  final UserEntity? userEntity;
  String error;
  final bool isLogoutSuccess;
  final bool isDeleteAccountSuccess;
  final LanguageModeEnum languageModeEnum;

  ProfileState({
    this.userEntity,
    this.error = '',
    this.isLogoutSuccess = false,
    this.isDeleteAccountSuccess = false,
    this.languageModeEnum = LanguageModeEnum.vi,
  });

  ProfileState copyWith({
    UserEntity? userEntity,
    String? error,
    bool? isLogoutSuccess,
    bool? isDeleteAccountSuccess,
    LanguageModeEnum? languageModeEnum,
  }) {
    return ProfileState(
      userEntity: userEntity ?? this.userEntity,
      error: error ?? this.error,
      isLogoutSuccess: isLogoutSuccess ?? this.isLogoutSuccess,
      isDeleteAccountSuccess: isDeleteAccountSuccess ?? this.isDeleteAccountSuccess,
      languageModeEnum: languageModeEnum ?? this.languageModeEnum,
    );
  }
}
