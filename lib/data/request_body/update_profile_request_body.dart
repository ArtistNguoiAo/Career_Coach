class UpdateProfileRequestBody {
  final String fullName;
  final String email;
  final String phone;

  UpdateProfileRequestBody({
    required this.fullName,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phone': phone,
    };
  }
}