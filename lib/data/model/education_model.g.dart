// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EducationModel _$EducationModelFromJson(Map<String, dynamic> json) =>
    _EducationModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userResumeId: (json['userResumeId'] as num?)?.toInt() ?? 0,
      displayOrder: (json['displayOrder'] as num?)?.toInt() ?? 0,
      school: json['school'] as String? ?? '',
      degree: json['degree'] as String? ?? '',
      major: json['major'] as String? ?? '',
      startTime: json['startTime'] as String? ?? '',
      endTime: json['endTime'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$EducationModelToJson(_EducationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userResumeId': instance.userResumeId,
      'displayOrder': instance.displayOrder,
      'school': instance.school,
      'degree': instance.degree,
      'major': instance.major,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'description': instance.description,
    };
