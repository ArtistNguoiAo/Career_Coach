import 'package:career_coach/data/model/activity_model.dart';
import 'package:career_coach/domain/entity/activity_entity.dart';

class ActivityMapper {
  static ActivityEntity toEntity(ActivityModel activityModel) {
    return ActivityEntity(
      id: activityModel.id,
      userResumeId: activityModel.userResumeId,
      displayOrder: activityModel.displayOrder,
      organization: activityModel.organization,
      position: activityModel.position,
      startTime: activityModel.startDate,
      endTime: activityModel.endDate,
      description: activityModel.description,
    );
  }
}