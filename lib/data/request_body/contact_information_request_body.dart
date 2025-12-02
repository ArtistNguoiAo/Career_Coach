class ContactInformationRequestBody {
  final int id;
  final int userResumeId;
  final String fullName;
  final String position;
  final String email;
  final String phoneNumber;
  final String address;
  final String gender;
  final String dateOfBirth;
  final String portfolio;
  final String github;
  final String linkedIn;
  final String facebook;

  ContactInformationRequestBody({
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userResumeId': userResumeId,
      'fullName': fullName,
      'position': position,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'portfolio': portfolio,
      'github': github,
      'linkedIn': linkedIn,
      'facebook': facebook,
    };
  }
}