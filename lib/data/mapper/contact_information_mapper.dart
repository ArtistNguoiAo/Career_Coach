import 'package:career_coach/data/model/contact_information_model.dart';
import 'package:career_coach/domain/entity/contact_information_entity.dart';

class ContactInformationMapper {
  static ContactInformationEntity toEntity(ContactInformationModel contactInformationModel) {
    return ContactInformationEntity(
      id: contactInformationModel.id,
      userResumeId: contactInformationModel.userResumeId,
      fullName: contactInformationModel.fullName,
      position: contactInformationModel.position,
      email: contactInformationModel.email,
      phoneNumber: contactInformationModel.phoneNumber,
      address: contactInformationModel.address,
      dateOfBirth: contactInformationModel.dateOfBirth,
      portfolio: contactInformationModel.portfolio,
      github: contactInformationModel.github,
      linkedIn: contactInformationModel.linkedIn,
      facebook: contactInformationModel.facebook,
    );
  }
}