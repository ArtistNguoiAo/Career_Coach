class ApiResponse<T> {
  final Result result;
  final T data;

  ApiResponse({
    required this.result,
    required this.data,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic json) fromJsonT,
      ) {
    return ApiResponse<T>(
      result: Result.fromJson(json['result'] ?? {}),
      data: fromJsonT(json['data']),
    );
  }
}

class Result {
  final String errorCode;
  final String message;
  final bool isOk;

  Result({
    required this.errorCode,
    required this.message,
    required this.isOk,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      errorCode: json['errorCode'] ?? '',
      message: json['message'] ?? '',
      isOk: json['isOk'] ?? false,
    );
  }
}
