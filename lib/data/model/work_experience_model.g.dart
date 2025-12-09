// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_experience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkExperienceModel _$WorkExperienceModelFromJson(Map<String, dynamic> json) =>
    _WorkExperienceModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userResumeId: (json['userResumeId'] as num?)?.toInt() ?? 0,
      displayOrder: (json['displayOrder'] as num?)?.toInt() ?? 0,
      company: json['company'] as String? ?? '',
      position: json['position'] as String? ?? '',
      startTime: json['startTime'] as String? ?? '',
      endTime: json['endTime'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$WorkExperienceModelToJson(
  _WorkExperienceModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'userResumeId': instance.userResumeId,
  'displayOrder': instance.displayOrder,
  'company': instance.company,
  'position': instance.position,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'description': instance.description,
};
