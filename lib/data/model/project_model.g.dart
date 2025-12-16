// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) =>
    _ProjectModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userResumeId: (json['userResumeId'] as num?)?.toInt() ?? 0,
      displayOrder: (json['displayOrder'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      position: json['position'] as String? ?? '',
      startTime: json['startTime'] as String? ?? '',
      endTime: json['endTime'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$ProjectModelToJson(_ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userResumeId': instance.userResumeId,
      'displayOrder': instance.displayOrder,
      'name': instance.name,
      'position': instance.position,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'description': instance.description,
    };
