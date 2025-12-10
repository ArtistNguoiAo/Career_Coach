part of 'favorite_cubit.dart';

class FavoriteState {
  final List<FavoriteEntity> listFavorite;
  String error;
  final bool isLoading;
  final bool isSavedSuccess;

  FavoriteState({
    this.listFavorite = const [],
    this.error = '',
    this.isLoading = false,
    this.isSavedSuccess = false,
  });

  FavoriteState copyWith({
    List<FavoriteEntity>? listFavorite,
    String? error,
    bool? isLoading,
    bool? isSavedSuccess,
  }) {
    return FavoriteState(
      listFavorite: listFavorite ?? this.listFavorite,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      isSavedSuccess: isSavedSuccess ?? this.isSavedSuccess,
    );
  }
}
