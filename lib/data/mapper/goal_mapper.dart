import 'package:career_coach/data/model/goal_model.dart';
import 'package:career_coach/domain/entity/goal_entity.dart';

class GoalMapper {
  static GoalEntity toEntity(GoalModel goalModel) {
    return GoalEntity(
      id: goalModel.id,
      userResumeId: goalModel.userResumeId,
      content: goalModel.content,
    );
  }
}