import 'package:career_coach/domain/enum/type_gender_enum.dart';

class ContactInformationEntity {
  final int id;
  final int userResumeId;
  final String fullName;
  final String position;
  final String email;
  final String phoneNumber;
  final String address;
  final TypeGenderEnum gender;
  final String dateOfBirth;
  final String portfolio;
  final String github;
  final String linkedIn;
  final String facebook;

  ContactInformationEntity({
    required this.id,
    required this.userResumeId,
    required this.fullName,
    required this.position,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.gender,
    required this.dateOfBirth,
    required this.portfolio,
    required this.github,
    required this.linkedIn,
    required this.facebook,
  });
}
