import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/repository/user_resume_repository.dart';

class CreateNewUserResumeWithAIUseCase {
  final UserResumeRepository _userResumeRepository;

  CreateNewUserResumeWithAIUseCase(this._userResumeRepository);

  Future<UserResumeEntity> call({
    required String content,
    int? sourceUserResumeId,
  }) async {
    return await _userResumeRepository.createNewUserResumeWithAI(
      content: content,
      sourceUserResumeId: sourceUserResumeId,
    );
  }
}