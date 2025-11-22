// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_resume_recent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserResumeRecentModel _$UserResumeRecentModelFromJson(
  Map<String, dynamic> json,
) => _UserResumeRecentModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? '',
  createdAt: json['createdAt'] as String? ?? '',
);

Map<String, dynamic> _$UserResumeRecentModelToJson(
  _UserResumeRecentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'createdAt': instance.createdAt,
};
