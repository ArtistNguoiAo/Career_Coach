import 'package:career_coach/data/mapper/activity_mapper.dart';
import 'package:career_coach/data/remote/activity_remote.dart';
import 'package:career_coach/data/request_body/activity_request_body.dart';
import 'package:career_coach/domain/entity/activity_entity.dart';
import 'package:career_coach/domain/repository/activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final ActivityRemote _activityRemote;

  ActivityRepositoryImpl(this._activityRemote);

  @override
  Future<List<ActivityEntity>> getActivities({required int userResumeId}) async {
    final response = await _activityRemote.getActivities(userResumeId: userResumeId);
    return response.data.map(ActivityMapper.toEntity).toList();
  }

  @override
  Future<List<ActivityEntity>> saveActivities({
    required int userResumeId,
    required List<ActivityEntity> listActivity,
  }) async {
    final response = await _activityRemote.saveActivities(
      userResumeId: userResumeId,
      listActivityRequestBody: listActivity.map((e) =>
          ActivityRequestBody(
              id: e.id,
              userResumeId: e.userResumeId,
              displayOrder: e.displayOrder,
              organization: e.organization,
              position: e.position,
              startTime: e.startTime,
              endTime: e.endTime,
              description: e.description
          )
      ).toList(),
    );
    return response.data.map(ActivityMapper.toEntity).toList();
  }
}
