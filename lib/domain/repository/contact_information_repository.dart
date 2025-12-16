import 'package:career_coach/domain/entity/contact_information_entity.dart';

abstract class ContactInformationRepository {
  Future<ContactInformationEntity> getContactInformation({
    required int userResumeId,
  });

  Future<ContactInformationEntity> saveContactInformation({
    required ContactInformationEntity contactInformationEntity,
  });
}