import 'package:career_coach/domain/repository/user_resume_repository.dart';

class DeleteUserResumeUseCase {
  final UserResumeRepository _userResumeRepository;

  DeleteUserResumeUseCase(this._userResumeRepository);

  Future<String> call({
    required int id,
  }) async {
    return await _userResumeRepository.deleteUserResume(
      id: id,
    );
  }
}