import 'package:career_coach/domain/entity/activity_entity.dart';

abstract class ActivityRepository {
  Future<List<ActivityEntity>> getActivities({
    required int userResumeId,
  });

  Future<List<ActivityEntity>> saveActivities({
    required int userResumeId,
    required List<ActivityEntity> listActivity,
  });
}