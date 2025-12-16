import 'package:career_coach/domain/entity/work_experience_entity.dart';
import 'package:career_coach/domain/repository/work_experience_repository.dart';

class SaveWorkExperiencesUseCase {
  final WorkExperienceRepository _workExperienceRepository;

  SaveWorkExperiencesUseCase(this._workExperienceRepository);

  Future<List<WorkExperienceEntity>> call({required int userResumeId, required List<WorkExperienceEntity> listWorkExperience}) async {
    return await _workExperienceRepository.saveWorkExperiences(
      userResumeId: userResumeId,
      listWorkExperience: listWorkExperience,
    );
  }
}