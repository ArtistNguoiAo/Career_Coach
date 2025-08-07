// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => ApiResponse<T>(
  result: Result.fromJson(json['result'] as Map<String, dynamic>),
  data: fromJsonT(json['data']),
);

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'result': instance.result,
  'data': toJsonT(instance.data),
};

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
  errorCode: json['errorCode'] as String,
  message: json['message'] as String,
  isOk: json['isOk'] as bool,
);

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
  'errorCode': instance.errorCode,
  'message': instance.message,
  'isOk': instance.isOk,
};
