import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/repository/user_resume_repository.dart';

class CreateNewUserResumeUseCase {
  final UserResumeRepository _userResumeRepository;

  CreateNewUserResumeUseCase(this._userResumeRepository);

  Future<UserResumeEntity> call({
    required int resumeId,
  }) async {
    return await _userResumeRepository.createNewUserResume(
      resumeId: resumeId,
    );
  }
}