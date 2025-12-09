import 'package:career_coach/data/model/project_model.dart';
import 'package:career_coach/domain/entity/project_entity.dart';

class ProjectMapper {
  static ProjectEntity toEntity(ProjectModel projectModel) {
    return ProjectEntity(
      id: projectModel.id,
      userResumeId: projectModel.userResumeId,
      displayOrder: projectModel.displayOrder,
      name: projectModel.name,
      position: projectModel.position,
      startTime: projectModel.startTime,
      endTime: projectModel.endTime,
      description: projectModel.description,
    );
  }
}