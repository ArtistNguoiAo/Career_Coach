import 'package:career_coach/domain/entity/goal_entity.dart';
import 'package:career_coach/domain/repository/goal_repository.dart';

class GetGoalUseCase {
  final GoalRepository _goalRepository;

  GetGoalUseCase(this._goalRepository);

  Future<GoalEntity> call({required int userResumeId}) async {
    return await _goalRepository.getGoal(
      userResumeId: userResumeId,
    );
  }
}