class ApiException implements Exception {
  final String errorCode;
  final String message;
  final bool isOk;

  ApiException({
    required this.errorCode,
    required this.message,
    required this.isOk,
  });

  @override
  String toString() {
    return 'ApiException: [$errorCode] $message (isOk: $isOk)';
  }
}
