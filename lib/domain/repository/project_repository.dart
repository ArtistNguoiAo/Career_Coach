import 'package:career_coach/domain/entity/project_entity.dart';

abstract class ProjectRepository {
  Future<List<ProjectEntity>> getProjects({
    required int userResumeId,
  });

  Future<List<ProjectEntity>> saveProjects({
    required int userResumeId,
    required List<ProjectEntity> listProject,
  });
}