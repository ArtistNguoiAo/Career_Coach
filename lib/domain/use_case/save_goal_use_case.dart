import 'package:career_coach/domain/entity/goal_entity.dart';
import 'package:career_coach/domain/repository/goal_repository.dart';

class SaveGoalUseCase {
  final GoalRepository _goalRepository;

  SaveGoalUseCase(this._goalRepository);

  Future<GoalEntity> call({required GoalEntity goalEntity}) async {
    return await _goalRepository.saveGoal(
      goalEntity: goalEntity,
    );
  }
}