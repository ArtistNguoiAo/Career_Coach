import 'package:career_coach/domain/entity/activity_entity.dart';
import 'package:career_coach/domain/repository/activity_repository.dart';

class SaveActivitiesUseCase {
  final ActivityRepository _activityRepository;

  SaveActivitiesUseCase(this._activityRepository);

  Future<List<ActivityEntity>> call({required int userResumeId, required List<ActivityEntity> listActivity}) async {
    return await _activityRepository.saveActivities(
      userResumeId: userResumeId,
      listActivity: listActivity,
    );
  }
}