part of 'profile_update_cubit.dart';

class ProfileUpdateState {
  final UserEntity? userEntity;
  final bool isLoading;
  String error;
  bool isUpdateSuccess;

  ProfileUpdateState({
    this.userEntity,
    this.isLoading = false,
    this.error = '',
    this.isUpdateSuccess = false,
  });

  ProfileUpdateState copyWith({
    UserEntity? userEntity,
    bool? isLoading,
    String? error,
    bool? isUpdateSuccess,
  }) {
    return ProfileUpdateState(
      userEntity: userEntity ?? this.userEntity,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isUpdateSuccess: isUpdateSuccess ?? this.isUpdateSuccess,
    );
  }
}