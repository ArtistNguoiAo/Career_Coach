// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    _ActivityModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userResumeId: (json['userResumeId'] as num?)?.toInt() ?? 0,
      displayOrder: (json['displayOrder'] as num?)?.toInt() ?? 0,
      organization: json['organization'] as String? ?? '',
      position: json['position'] as String? ?? '',
      startTime: json['startTime'] as String? ?? '',
      endTime: json['endTime'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$ActivityModelToJson(_ActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userResumeId': instance.userResumeId,
      'displayOrder': instance.displayOrder,
      'organization': instance.organization,
      'position': instance.position,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'description': instance.description,
    };
