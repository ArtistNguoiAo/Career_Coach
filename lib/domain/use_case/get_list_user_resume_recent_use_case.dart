import 'package:career_coach/domain/entity/user_resume_recent_entity.dart';
import 'package:career_coach/domain/repository/user_resume_repository.dart';

class GetListUserResumeRecentUseCase {
  final UserResumeRepository _userResumeRepository;

  GetListUserResumeRecentUseCase(this._userResumeRepository);

  Future<List<UserResumeRecentEntity>> call({
    required int limit,
  }) async {
    return await _userResumeRepository.getListUserResumeRecent(
      limit: limit,
    );
  }
}