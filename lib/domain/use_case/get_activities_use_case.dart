import 'package:career_coach/domain/entity/activity_entity.dart';
import 'package:career_coach/domain/repository/activity_repository.dart';

class GetActivitiesUseCase {
  final ActivityRepository _activityRepository;

  GetActivitiesUseCase(this._activityRepository);

  Future<List<ActivityEntity>> call({required int userResumeId}) async {
    return await _activityRepository.getActivities(
      userResumeId: userResumeId,
    );
  }
}