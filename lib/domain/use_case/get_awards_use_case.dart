import 'package:career_coach/domain/entity/award_entity.dart';
import 'package:career_coach/domain/repository/award_repository.dart';

class GetAwardsUseCase {
  final AwardRepository _awardRepository;

  GetAwardsUseCase(this._awardRepository);

  Future<List<AwardEntity>> call({required int userResumeId}) async {
    return await _awardRepository.getAwards(
      userResumeId: userResumeId,
    );
  }
}