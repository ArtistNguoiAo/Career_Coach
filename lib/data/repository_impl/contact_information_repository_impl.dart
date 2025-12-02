import 'package:career_coach/data/mapper/contact_information_mapper.dart';
import 'package:career_coach/data/remote/contact_information_remote.dart';
import 'package:career_coach/data/request_body/contact_information_request_body.dart';
import 'package:career_coach/domain/entity/contact_information_entity.dart';
import 'package:career_coach/domain/repository/contact_information_repository.dart';

class ContactInformationRepositoryImpl implements ContactInformationRepository {
  final ContactInformationRemote _contactInformationRemote;

  ContactInformationRepositoryImpl(this._contactInformationRemote);

  @override
  Future<ContactInformationEntity> getContactInformation({required int userResumeId}) async {
    final response = await _contactInformationRemote.getContactInformation(userResumeId: userResumeId);
    return ContactInformationMapper.toEntity(response.data);
  }

  @override
  Future<ContactInformationEntity> saveContactInformation({required ContactInformationEntity contactInformationEntity}) async {
    final response = await _contactInformationRemote.saveContactInformation(
      contactInformationRequestBody: ContactInformationRequestBody(
        id: contactInformationEntity.id,
        userResumeId: contactInformationEntity.userResumeId,
        fullName: contactInformationEntity.fullName,
        position: contactInformationEntity.position,
        email: contactInformationEntity.email,
        phoneNumber: contactInformationEntity.phoneNumber,
        address: contactInformationEntity.address,
        gender: contactInformationEntity.gender.name,
        dateOfBirth: contactInformationEntity.dateOfBirth,
        portfolio: contactInformationEntity.portfolio,
        github: contactInformationEntity.github,
        linkedIn: contactInformationEntity.linkedIn,
        facebook: contactInformationEntity.facebook,
      )
    );
    return ContactInformationMapper.toEntity(response.data);
  }

}