// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_resume_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserResumeModel _$UserResumeModelFromJson(Map<String, dynamic> json) =>
    _UserResumeModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      numberOfColumns: (json['numberOfColumns'] as num?)?.toInt() ?? 0,
      language: json['language'] as String? ?? 'VIETNAMESE',
      fontFamily: json['fontFamily'] as String? ?? 'ARIAL',
      fontSize: (json['fontSize'] as num?)?.toInt() ?? 16,
      lineHeight: (json['lineHeight'] as num?)?.toDouble() ?? 1.0,
      color: json['color'] as String? ?? '#000000',
      layouts:
          (json['layouts'] as List<dynamic>?)
              ?.map(
                (e) =>
                    UserResumeLayoutModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserResumeModelToJson(_UserResumeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'numberOfColumns': instance.numberOfColumns,
      'language': instance.language,
      'fontFamily': instance.fontFamily,
      'fontSize': instance.fontSize,
      'lineHeight': instance.lineHeight,
      'color': instance.color,
      'layouts': instance.layouts,
    };
