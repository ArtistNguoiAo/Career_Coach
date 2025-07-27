class ProviderLoginRequestBody {
  final String externalToken;
  final String provider;
  final String deviceInfo;

  ProviderLoginRequestBody({
    required this.externalToken,
    required this.provider,
    required this.deviceInfo,
  });

  Map<String, dynamic> toJson() {
    return {
      'externalToken': externalToken,
      'provider': provider,
      'deviceInfo': deviceInfo,
    };
  }
}