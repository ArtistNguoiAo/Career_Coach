import 'package:career_coach/data/mapper/skill_mapper.dart';
import 'package:career_coach/data/remote/skill_remote.dart';
import 'package:career_coach/data/request_body/skill_request_body.dart';
import 'package:career_coach/domain/entity/skill_entity.dart';
import 'package:career_coach/domain/repository/skill_repository.dart';

class SkillRepositoryImpl implements SkillRepository {
  final SkillRemote _skillRemote;

  SkillRepositoryImpl(this._skillRemote);

  @override
  Future<List<SkillEntity>> getSkills({required int userResumeId}) async {
    final response = await _skillRemote.getSkills(userResumeId: userResumeId);
    return response.data.map(SkillMapper.toEntity).toList();
  }

  @override
  Future<List<SkillEntity>> saveSkills({required int userResumeId, required List<SkillEntity> listSkill}) async {
    final response = await _skillRemote.saveSkills(
      userResumeId: userResumeId,
      listSkillRequestBody: listSkill.map((e) =>
          SkillRequestBody(
            id: e.id,
            userResumeId: userResumeId,
            displayOrder: e.displayOrder,
            name: e.name,
            description: e.description,
          )
      ).toList(),
    );
    return response.data.map(SkillMapper.toEntity).toList();
  }

}