class ApiException implements Exception {
  final String errorCode;
  final String message;
  final bool ok;
  bool? isUnauthorized;

  ApiException({
    required this.errorCode,
    required this.message,
    required this.ok,
    this.isUnauthorized,
  });

  @override
  String toString() {
    return '[$errorCode] $message';
  }
}
