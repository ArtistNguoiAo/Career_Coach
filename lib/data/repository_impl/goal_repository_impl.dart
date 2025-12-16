import 'package:career_coach/data/mapper/goal_mapper.dart';
import 'package:career_coach/data/remote/goal_remote.dart';
import 'package:career_coach/data/request_body/goal_request_body.dart';
import 'package:career_coach/domain/entity/goal_entity.dart';
import 'package:career_coach/domain/repository/goal_repository.dart';

class GoalRepositoryImpl implements GoalRepository {
  final GoalRemote _goalRemote;

  GoalRepositoryImpl(this._goalRemote);

  @override
  Future<GoalEntity> getGoal({required int userResumeId}) async {
    final response = await _goalRemote.getGoal(userResumeId: userResumeId);
    return GoalMapper.toEntity(response.data);
  }

  @override
  Future<GoalEntity> saveGoal({required GoalEntity goalEntity}) async {
    final response = await _goalRemote.saveGoal(
      goalRequestBody: GoalRequestBody(
        id: goalEntity.id,
        userResumeId: goalEntity.userResumeId,
        content: goalEntity.content,
      )
    );
    return GoalMapper.toEntity(response.data);
  }

}