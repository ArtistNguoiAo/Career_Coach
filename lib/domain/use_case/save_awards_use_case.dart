import 'package:career_coach/domain/entity/award_entity.dart';
import 'package:career_coach/domain/repository/award_repository.dart';

class SaveAwardsUseCase {
  final AwardRepository _awardRepository;

  SaveAwardsUseCase(this._awardRepository);

  Future<List<AwardEntity>> call({required int userResumeId, required List<AwardEntity> listAward}) async {
    return await _awardRepository.saveAwards(
      userResumeId: userResumeId,
      listAward: listAward,
    );
  }
}