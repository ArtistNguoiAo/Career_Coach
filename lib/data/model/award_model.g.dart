// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'award_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AwardModel _$AwardModelFromJson(Map<String, dynamic> json) => _AwardModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  userResumeId: (json['userResumeId'] as num?)?.toInt() ?? 0,
  displayOrder: (json['displayOrder'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  awardedAt: json['awardedAt'] as String? ?? '',
);

Map<String, dynamic> _$AwardModelToJson(_AwardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userResumeId': instance.userResumeId,
      'displayOrder': instance.displayOrder,
      'name': instance.name,
      'awardedAt': instance.awardedAt,
    };
