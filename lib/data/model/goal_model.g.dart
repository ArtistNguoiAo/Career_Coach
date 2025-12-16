// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoalModel _$GoalModelFromJson(Map<String, dynamic> json) => _GoalModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  userResumeId: (json['userResumeId'] as num?)?.toInt() ?? 0,
  content: json['content'] as String? ?? '',
);

Map<String, dynamic> _$GoalModelToJson(_GoalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userResumeId': instance.userResumeId,
      'content': instance.content,
    };
