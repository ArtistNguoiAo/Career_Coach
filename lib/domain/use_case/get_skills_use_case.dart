import 'package:career_coach/domain/entity/skill_entity.dart';
import 'package:career_coach/domain/repository/skill_repository.dart';

class GetSkillsUseCase {
  final SkillRepository _skillRepository;

  GetSkillsUseCase(this._skillRepository);

  Future<List<SkillEntity>> call({required int userResumeId}) async {
    return await _skillRepository.getSkills(
      userResumeId: userResumeId,
    );
  }
}