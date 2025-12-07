import 'package:career_coach/domain/entity/skill_entity.dart';

abstract class SkillRepository {
  Future<List<SkillEntity>> getSkills({
    required int userResumeId,
  });

  Future<List<SkillEntity>> saveSkills({
    required int userResumeId,
    required List<SkillEntity> listSkill,
  });
}