import 'package:career_coach/data/mapper/contact_information_mapper.dart';
import 'package:career_coach/data/remote/contact_information_remote.dart';
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
  Future<ContactInformationEntity> saveContactInformation({required ContactInformationEntity contactInformationEntity}) {
    // TODO: implement saveContactInformation
    throw UnimplementedError();
  }

}