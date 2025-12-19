class ContactInformationEntity {
  final int id;
  final int userResumeId;
  String fullName;
  String position;
  String email;
  String phoneNumber;
  String address;
  String dateOfBirth;
  String portfolio;
  String github;
  String linkedIn;
  String facebook;

  ContactInformationEntity({
    required this.id,
    required this.userResumeId,
    required this.fullName,
    required this.position,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.dateOfBirth,
    required this.portfolio,
    required this.github,
    required this.linkedIn,
    required this.facebook,
  });
}
