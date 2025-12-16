// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_resume_layout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserResumeLayoutModel _$UserResumeLayoutModelFromJson(
  Map<String, dynamic> json,
) => _UserResumeLayoutModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  side: json['side'] as String? ?? '',
  sections:
      (json['sections'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  widthPercentage: (json['widthPercentage'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$UserResumeLayoutModelToJson(
  _UserResumeLayoutModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'side': instance.side,
  'sections': instance.sections,
  'widthPercentage': instance.widthPercentage,
};
