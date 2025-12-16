import 'package:career_coach/domain/entity/work_experience_entity.dart';
import 'package:career_coach/domain/repository/work_experience_repository.dart';

class GetWorkExperiencesUseCase {
  final WorkExperienceRepository _workExperienceRepository;

  GetWorkExperiencesUseCase(this._workExperienceRepository);

  Future<List<WorkExperienceEntity>> call({required int userResumeId}) async {
    return await _workExperienceRepository.getWorkExperiences(
      userResumeId: userResumeId,
    );
  }
}