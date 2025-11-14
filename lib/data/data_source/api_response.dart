import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final Result result;
  final T data;

  ApiResponse({required this.result, required this.data});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}

@JsonSerializable()
class Result {
  final String errorCode;
  final String message;
  final bool isOk;

  Result({required this.errorCode, required this.message, required this.isOk});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable(genericArgumentFactories: true)
class Page<T> {
  final int totalPages;
  final int totalElements;
  final int size;
  final int number;
  final List<T> content;

  Page({
    required this.totalPages,
    required this.totalElements,
    required this.size,
    required this.number,
    required this.content,
  });

  factory Page.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$PageFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PageToJson(this, toJsonT);
}
