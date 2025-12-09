import 'package:career_coach/data/mapper/project_mapper.dart';
import 'package:career_coach/data/remote/project_remote.dart';
import 'package:career_coach/data/request_body/project_request_body.dart';
import 'package:career_coach/domain/entity/project_entity.dart';
import 'package:career_coach/domain/repository/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectRemote _projectRemote;

  ProjectRepositoryImpl(this._projectRemote);

  @override
  Future<List<ProjectEntity>> getProjects({required int userResumeId}) async {
    final response = await _projectRemote.getProjects(userResumeId: userResumeId);
    return response.data.map(ProjectMapper.toEntity).toList();
  }

  @override
  Future<List<ProjectEntity>> saveProjects({
    required int userResumeId,
    required List<ProjectEntity> listProject,
  }) async {
    final response = await _projectRemote.saveProjects(
      userResumeId: userResumeId,
      listProjectRequestBody: listProject.map((e) =>
          ProjectRequestBody(
              id: e.id,
              userResumeId: e.userResumeId,
              displayOrder: e.displayOrder,
              name: e.name,
              position: e.position,
              startTime: e.startTime,
              endTime: e.endTime,
              description: e.description
          )
      ).toList(),
    );
    return response.data.map(ProjectMapper.toEntity).toList();
  }
}
