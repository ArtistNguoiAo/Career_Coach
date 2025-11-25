// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResumeModel _$ResumeModelFromJson(Map<String, dynamic> json) => _ResumeModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? '',
  description: json['description'] as String? ?? '',
  thumbnailUrl: json['thumbnailUrl'] as String? ?? '',
  type: json['type'] as String? ?? '',
  viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
  downloadCount: (json['downloadCount'] as num?)?.toInt() ?? 0,
  sections:
      (json['sections'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$ResumeModelToJson(_ResumeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'thumbnailUrl': instance.thumbnailUrl,
      'type': instance.type,
      'viewCount': instance.viewCount,
      'downloadCount': instance.downloadCount,
      'sections': instance.sections,
    };
