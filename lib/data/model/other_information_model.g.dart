// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_information_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OtherInformationModel _$OtherInformationModelFromJson(
  Map<String, dynamic> json,
) => _OtherInformationModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  userResumeId: (json['userResumeId'] as num?)?.toInt() ?? 0,
  content: json['content'] as String? ?? '',
);

Map<String, dynamic> _$OtherInformationModelToJson(
  _OtherInformationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'userResumeId': instance.userResumeId,
  'content': instance.content,
};
