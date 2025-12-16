import 'package:career_coach/data/model/other_information_model.dart';
import 'package:career_coach/domain/entity/other_information_entity.dart';

class OtherInformationMapper {
  static OtherInformationEntity toEntity(OtherInformationModel otherInformationModel) {
    return OtherInformationEntity(
      id: otherInformationModel.id,
      userResumeId: otherInformationModel.userResumeId,
      content: otherInformationModel.content,
    );
  }
}