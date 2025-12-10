import 'package:career_coach/domain/entity/education_entity.dart';
import 'package:career_coach/domain/repository/education_repository.dart';

class GetEducationsUseCase {
  final EducationRepository _educationRepository;

  GetEducationsUseCase(this._educationRepository);

  Future<List<EducationEntity>> call({required int userResumeId}) async {
    return await _educationRepository.getEducations(
      userResumeId: userResumeId,
    );
  }
}