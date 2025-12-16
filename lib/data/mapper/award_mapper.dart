import 'package:career_coach/data/model/award_model.dart';
import 'package:career_coach/domain/entity/award_entity.dart';

class AwardMapper {
  static AwardEntity toEntity(AwardModel awardModel) {
    return AwardEntity(
      id: awardModel.id,
      userResumeId: awardModel.userResumeId,
      displayOrder: awardModel.displayOrder,
      name: awardModel.name,
      awardedAt: awardModel.awardedAt,
    );
  }
}