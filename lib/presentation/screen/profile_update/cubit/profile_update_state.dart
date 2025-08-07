part of 'profile_update_cubit.dart';

@immutable
sealed class ProfileUpdateState {}

final class ProfileUpdateInitial extends ProfileUpdateState {}

final class ProfileUpdateLoading extends ProfileUpdateState {}

final class ProfileUpdateSuccess extends ProfileUpdateState {}

final class ProfileUpdateLoaded extends ProfileUpdateState {
  final UserEntity userEntity;

  ProfileUpdateLoaded({
    required this.userEntity,
  });
}

final class ProfileUpdateError extends ProfileUpdateState {
  final String message;

  ProfileUpdateError({
    required this.message,
  });
}