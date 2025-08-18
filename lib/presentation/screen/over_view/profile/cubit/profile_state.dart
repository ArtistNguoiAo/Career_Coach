part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final UserEntity userEntity;

  ProfileLoaded({required this.userEntity});
}

final class ProfileLogoutSuccess extends ProfileState {}

final class ProfileDeleteAccountSuccess extends ProfileState {}

final class ProfileError extends ProfileState {
  final String error;

  ProfileError({required this.error});
}