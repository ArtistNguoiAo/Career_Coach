import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/repository/user_resume_repository.dart';

class GetListUserResumeUseCase {
  final UserResumeRepository _userResumeRepository;

  GetListUserResumeUseCase(this._userResumeRepository);

  Future<List<UserResumeEntity>> call({
    required int page,
    required int size,
    required String status,
  }) async {
    return await _userResumeRepository.getListUserResume(
      page: page,
      size: size,
      status: status,
    );
  }
}