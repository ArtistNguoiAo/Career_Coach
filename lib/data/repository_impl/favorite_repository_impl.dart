import 'package:career_coach/data/mapper/favorite_mapper.dart';
import 'package:career_coach/data/remote/favorite_remote.dart';
import 'package:career_coach/data/request_body/favorite_request_body.dart';
import 'package:career_coach/domain/entity/favorite_entity.dart';
import 'package:career_coach/domain/repository/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteRemote _favoriteRemote;

  FavoriteRepositoryImpl(this._favoriteRemote);

  @override
  Future<List<FavoriteEntity>> getFavorites({required int userResumeId}) async {
    final response = await _favoriteRemote.getFavorites(userResumeId: userResumeId);
    return response.data.map(FavoriteMapper.toEntity).toList();
  }

  @override
  Future<List<FavoriteEntity>> saveFavorites({
    required int userResumeId,
    required List<FavoriteEntity> listFavorite,
  }) async {
    final response = await _favoriteRemote.saveFavorites(
      userResumeId: userResumeId,
      listFavoriteRequestBody: listFavorite.map((e) =>
          FavoriteRequestBody(
              id: e.id,
              userResumeId: e.userResumeId,
              displayOrder: e.displayOrder,
              name: e.name,
          )
      ).toList(),
    );
    return response.data.map(FavoriteMapper.toEntity).toList();
  }
}
