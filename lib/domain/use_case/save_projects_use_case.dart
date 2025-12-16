import 'package:career_coach/domain/entity/project_entity.dart';
import 'package:career_coach/domain/repository/project_repository.dart';

class SaveProjectsUseCase {
  final ProjectRepository _projectRepository;

  SaveProjectsUseCase(this._projectRepository);

  Future<List<ProjectEntity>> call({required int userResumeId, required List<ProjectEntity> listProject}) async {
    return await _projectRepository.saveProjects(
      userResumeId: userResumeId,
      listProject: listProject,
    );
  }
}