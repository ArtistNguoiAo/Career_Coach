part of 'avatar_cubit.dart';

class AvatarState {
  final AvatarEntity? avatarEntity;
  final bool isLoading;
  String error;

  AvatarState({this.avatarEntity, this.isLoading = false, this.error = ''});

  AvatarState copyWith({AvatarEntity? avatarEntity, bool? isLoading, String? error}) {
    return AvatarState(
      avatarEntity: avatarEntity ?? this.avatarEntity,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
