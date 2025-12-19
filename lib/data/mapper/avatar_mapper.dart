import 'package:career_coach/data/model/avatar_model.dart';
import 'package:career_coach/domain/entity/avatar_entity.dart';

class AvatarMapper {
  static AvatarEntity toEntity(AvatarModel avatarModel) {
    return AvatarEntity(
      id: avatarModel.id,
      userResumeId: avatarModel.userResumeId,
      alt: avatarModel.alt,
      filename: avatarModel.filename,
      url: avatarModel.url,
    );
  }
}