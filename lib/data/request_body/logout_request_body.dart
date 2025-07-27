class LogoutRequestBody {
  final String refreshToken;

  LogoutRequestBody({required this.refreshToken});

  Map<String, dynamic> toJson() {
    return {
      'refreshToken': refreshToken,
    };
  }
}
