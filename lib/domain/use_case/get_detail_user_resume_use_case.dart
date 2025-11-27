import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/repository/user_resume_repository.dart';

class GetDetailUserResumeUseCase {
  final UserResumeRepository _userResumeRepository;

  GetDetailUserResumeUseCase(this._userResumeRepository);

  Future<UserResumeEntity> call({required int id}) async {
    return await _userResumeRepository.getDetailUserResume(id: id);
  }
}