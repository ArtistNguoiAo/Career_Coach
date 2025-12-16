import 'package:career_coach/data/mapper/work_experience_mapper.dart';
import 'package:career_coach/data/remote/work_experience_remote.dart';
import 'package:career_coach/data/request_body/work_experience_request_body.dart';
import 'package:career_coach/domain/entity/work_experience_entity.dart';
import 'package:career_coach/domain/repository/work_experience_repository.dart';

class WorkExperienceRepositoryImpl implements WorkExperienceRepository {
  final WorkExperienceRemote _workExperienceRemote;

  WorkExperienceRepositoryImpl(this._workExperienceRemote);

  @override
  Future<List<WorkExperienceEntity>> getWorkExperiences({required int userResumeId}) async {
    final response = await _workExperienceRemote.getActivities(userResumeId: userResumeId);
    return response.data.map(WorkExperienceMapper.toEntity).toList();
  }

  @override
  Future<List<WorkExperienceEntity>> saveWorkExperiences({
    required int userResumeId,
    required List<WorkExperienceEntity> listWorkExperience,
  }) async {
    final response = await _workExperienceRemote.saveActivities(
      userResumeId: userResumeId,
      listWorkExperienceRequestBody: listWorkExperience.map((e) =>
          WorkExperienceRequestBody(
              id: e.id,
              userResumeId: e.userResumeId,
              displayOrder: e.displayOrder,
              company: e.company,
              position: e.position,
              startTime: e.startTime,
              endTime: e.endTime,
              description: e.description
          )
      ).toList(),
    );
    return response.data.map(WorkExperienceMapper.toEntity).toList();
  }
}
