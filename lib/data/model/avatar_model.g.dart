// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AvatarModel _$AvatarModelFromJson(Map<String, dynamic> json) => _AvatarModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  userResumeId: (json['userResumeId'] as num?)?.toInt() ?? 0,
  alt: json['alt'] as String? ?? '',
  filename: json['filename'] as String? ?? '',
  url: json['url'] as String? ?? '',
);

Map<String, dynamic> _$AvatarModelToJson(_AvatarModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userResumeId': instance.userResumeId,
      'alt': instance.alt,
      'filename': instance.filename,
      'url': instance.url,
    };
