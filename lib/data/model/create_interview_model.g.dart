// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_interview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateInterviewModel _$CreateInterviewModelFromJson(
  Map<String, dynamic> json,
) => _CreateInterviewModel(
  sessionId: (json['sessionId'] as num?)?.toInt() ?? 0,
  experienceLevel: json['experienceLevel'] as String? ?? "",
  status: json['status'] as String? ?? "",
  initialMessage: json['initialMessage'] as String? ?? "",
  startedAt: json['startedAt'] as String? ?? "",
);

Map<String, dynamic> _$CreateInterviewModelToJson(
  _CreateInterviewModel instance,
) => <String, dynamic>{
  'sessionId': instance.sessionId,
  'experienceLevel': instance.experienceLevel,
  'status': instance.status,
  'initialMessage': instance.initialMessage,
  'startedAt': instance.startedAt,
};
