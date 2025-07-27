class RefreshRequestBody {
  final String refreshToken;

  RefreshRequestBody({
    required this.refreshToken,
  });

  Map<String, dynamic> toJson() {
    return {
      'refreshToken': refreshToken,
    };
  }
}