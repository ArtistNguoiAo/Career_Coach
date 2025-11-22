import 'package:career_coach/data/mapper/user_resume_recent_mapper.dart';
import 'package:career_coach/data/remote/user_resume_remote.dart';
import 'package:career_coach/domain/entity/user_resume_recent_entity.dart';
import 'package:career_coach/domain/repository/user_resume_repository.dart';

class UserResumeRepositoryImpl implements UserResumeRepository {
  final UserResumeRemote _userResumeRemote;

  UserResumeRepositoryImpl(this._userResumeRemote);

  @override
  Future<List<UserResumeRecentEntity>> getListUserResumeRecent({
    required int limit,
  }) async {
    final response = await _userResumeRemote.getListUserResumeRecent(
      limit: limit,
    );
    return response.data.map(UserResumeRecentMapper.toEntity).toList();
  }
}
