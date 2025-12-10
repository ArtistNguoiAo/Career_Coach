import 'package:career_coach/domain/entity/favorite_entity.dart';
import 'package:career_coach/domain/repository/favorite_repository.dart';

class GetFavoritesUseCase {
  final FavoriteRepository _favoriteRepository;

  GetFavoritesUseCase(this._favoriteRepository);

  Future<List<FavoriteEntity>> call({required int userResumeId}) async {
    return await _favoriteRepository.getFavorites(
      userResumeId: userResumeId,
    );
  }
}