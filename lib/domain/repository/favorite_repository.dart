import 'package:career_coach/domain/entity/favorite_entity.dart';

abstract class FavoriteRepository {
  Future<List<FavoriteEntity>> getFavorites({
    required int userResumeId,
  });

  Future<List<FavoriteEntity>> saveFavorites({
    required int userResumeId,
    required List<FavoriteEntity> listFavorite,
  });
}