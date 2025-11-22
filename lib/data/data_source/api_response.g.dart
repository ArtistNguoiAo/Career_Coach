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

PagedData<T> _$PagedDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PagedData<T>(
  content: (json['content'] as List<dynamic>).map(fromJsonT).toList(),
  page: Page.fromJson(json['page'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PagedDataToJson<T>(
  PagedData<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'content': instance.content.map(toJsonT).toList(),
  'page': instance.page,
};

Page _$PageFromJson(Map<String, dynamic> json) => Page(
  size: (json['size'] as num).toInt(),
  number: (json['number'] as num).toInt(),
  totalElements: (json['totalElements'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
);

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
  'size': instance.size,
  'number': instance.number,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
};
