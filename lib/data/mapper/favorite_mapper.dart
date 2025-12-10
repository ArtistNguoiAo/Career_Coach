import 'package:career_coach/data/model/favorite_model.dart';
import 'package:career_coach/domain/entity/favorite_entity.dart';

class FavoriteMapper {
  static FavoriteEntity toEntity(FavoriteModel activityModel) {
    return FavoriteEntity(
      id: activityModel.id,
      userResumeId: activityModel.userResumeId,
      displayOrder: activityModel.displayOrder,
      name: activityModel.name,
    );
  }
}