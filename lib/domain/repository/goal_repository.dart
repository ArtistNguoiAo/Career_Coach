import 'package:career_coach/domain/entity/goal_entity.dart';

abstract class GoalRepository {
  Future<GoalEntity> getGoal({
    required int userResumeId,
  });

  Future<GoalEntity> saveGoal({
    required GoalEntity goalEntity,
  });
}