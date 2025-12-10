import 'package:career_coach/domain/entity/favorite_entity.dart';
import 'package:career_coach/domain/repository/favorite_repository.dart';

class SaveFavoritesUseCase {
  final FavoriteRepository _favoriteRepository;

  SaveFavoritesUseCase(this._favoriteRepository);

  Future<List<FavoriteEntity>> call({required int userResumeId, required List<FavoriteEntity> listFavorite}) async {
    return await _favoriteRepository.saveFavorites(
      userResumeId: userResumeId,
      listFavorite: listFavorite,
    );
  }
}