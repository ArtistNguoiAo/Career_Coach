import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/repository/user_resume_repository.dart';

class SaveUserResumeUseCase {
  final UserResumeRepository _userResumeRepository;

  SaveUserResumeUseCase(this._userResumeRepository);

  Future<UserResumeEntity> call({required int id, required UserResumeEntity userResumeEntity}) async {
    return await _userResumeRepository.saveUserResume(id: id, userResumeEntity: userResumeEntity);
  }
}
