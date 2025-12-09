import 'package:career_coach/domain/entity/award_entity.dart';

abstract class AwardRepository {
  Future<List<AwardEntity>> getAwards({
    required int userResumeId,
  });

  Future<List<AwardEntity>> saveAwards({
    required int userResumeId,
    required List<AwardEntity> listAward,
  });
}