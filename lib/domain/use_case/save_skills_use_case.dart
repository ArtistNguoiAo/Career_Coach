import 'package:career_coach/domain/entity/skill_entity.dart';
import 'package:career_coach/domain/repository/skill_repository.dart';

class SaveSkillsUseCase {
  final SkillRepository _skillRepository;

  SaveSkillsUseCase(this._skillRepository);

  Future<List<SkillEntity>> call({required int userResumeId, required List<SkillEntity> listSkill}) async {
    return await _skillRepository.saveSkills(
      userResumeId: userResumeId,
      listSkill: listSkill
    );
  }
}