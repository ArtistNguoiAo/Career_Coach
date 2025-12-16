import 'package:career_coach/domain/entity/project_entity.dart';
import 'package:career_coach/domain/repository/project_repository.dart';

class GetProjectsUseCase {
  final ProjectRepository _projectRepository;

  GetProjectsUseCase(this._projectRepository);

  Future<List<ProjectEntity>> call({required int userResumeId}) async {
    return await _projectRepository.getProjects(
      userResumeId: userResumeId,
    );
  }
}