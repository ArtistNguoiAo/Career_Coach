import 'package:career_coach/domain/repository/user_resume_repository.dart';

class DeleteUserResumeBatchUseCase {
  final UserResumeRepository _userResumeRepository;

  DeleteUserResumeBatchUseCase(this._userResumeRepository);

  Future<String> call({
    required List<int> ids,
  }) async {
    return await _userResumeRepository.deleteUserResumeBatch(
      ids: ids,
    );
  }
}