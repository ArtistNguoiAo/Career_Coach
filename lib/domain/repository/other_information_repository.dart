import 'package:career_coach/domain/entity/other_information_entity.dart';

abstract class OtherInformationRepository {
  Future<OtherInformationEntity> getOtherInformation({
    required int userResumeId,
  });

  Future<OtherInformationEntity> saveOtherInformation({
    required OtherInformationEntity otherInformationEntity,
  });
}