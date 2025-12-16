import 'package:career_coach/data/model/skill_model.dart';
import 'package:career_coach/domain/entity/skill_entity.dart';

class SkillMapper {
  static SkillEntity toEntity(SkillModel skillModel) {
    return SkillEntity(
      id: skillModel.id,
      userResumeId: skillModel.userResumeId,
      displayOrder: skillModel.displayOrder,
      name: skillModel.name,
      description: skillModel.description,
    );
  }
}