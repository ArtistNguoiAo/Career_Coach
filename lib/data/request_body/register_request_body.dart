class RegisterRequestBody {
  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String avatar;

  RegisterRequestBody({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.avatar,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'password': password,
      'avatar': avatar,
    };
  }
}
