import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/repository/user_resume_repository.dart';

class CreateNewUserResumeCopyUseCase {
  final UserResumeRepository _userResumeRepository;

  CreateNewUserResumeCopyUseCase(this._userResumeRepository);

  Future<UserResumeEntity> call({
    required int resumeId,
    required int userResumeId,
  }) async {
    return await _userResumeRepository.createNewUserResumeCopy(
      resumeId: resumeId,
      userResumeId: userResumeId,
    );
  }
}