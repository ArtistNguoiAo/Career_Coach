import 'package:career_coach/domain/entity/education_entity.dart';
import 'package:career_coach/domain/repository/education_repository.dart';

class SaveEducationsUseCase {
  final EducationRepository _educationRepository;

  SaveEducationsUseCase(this._educationRepository);

  Future<List<EducationEntity>> call({required int userResumeId, required List<EducationEntity> listEducation}) async {
    return await _educationRepository.saveEducations(
      userResumeId: userResumeId,
      listEducation: listEducation,
    );
  }
}