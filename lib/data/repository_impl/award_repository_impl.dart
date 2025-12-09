import 'package:career_coach/data/mapper/award_mapper.dart';
import 'package:career_coach/data/remote/award_remote.dart';
import 'package:career_coach/data/request_body/award_request_body.dart';
import 'package:career_coach/domain/entity/award_entity.dart';
import 'package:career_coach/domain/repository/award_repository.dart';

class AwardRepositoryImpl implements AwardRepository {
  final AwardRemote _awardRemote;

  AwardRepositoryImpl(this._awardRemote);

  @override
  Future<List<AwardEntity>> getAwards({required int userResumeId}) async {
    final response = await _awardRemote.getAwards(userResumeId: userResumeId);
    return response.data.map(AwardMapper.toEntity).toList();
  }

  @override
  Future<List<AwardEntity>> saveAwards({required int userResumeId, required List<AwardEntity> listAward}) async {
    final response = await _awardRemote.saveAwards(
      userResumeId: userResumeId,
      listAwardRequestBody: listAward
          .map(
            (e) => AwardRequestBody(
              id: e.id,
              userResumeId: e.userResumeId,
              displayOrder: e.displayOrder,
              name: e.name,
              awardedAt: e.awardedAt,
            ),
          )
          .toList(),
    );
    return response.data.map(AwardMapper.toEntity).toList();
  }
}
