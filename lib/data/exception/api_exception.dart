class ApiException implements Exception {
  final String errorCode;
  final String message;
  final bool isOk;
  bool? isUnauthorized;

  ApiException({
    required this.errorCode,
    required this.message,
    required this.isOk,
    this.isUnauthorized,
  });

  @override
  String toString() {
    return '[$errorCode] $message';
  }
}
