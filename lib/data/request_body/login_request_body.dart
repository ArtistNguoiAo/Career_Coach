class LoginRequestBody {
  final String login;
  final String password;

  LoginRequestBody({
    required this.login,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'password': password,
    };
  }
}