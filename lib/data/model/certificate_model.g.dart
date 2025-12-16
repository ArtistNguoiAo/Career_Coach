// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CertificateModel _$CertificateModelFromJson(Map<String, dynamic> json) =>
    _CertificateModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userResumeId: (json['userResumeId'] as num?)?.toInt() ?? 0,
      displayOrder: (json['displayOrder'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      certificatedAt: json['certificatedAt'] as String? ?? '',
      certificateLink: json['certificateLink'] as String? ?? '',
    );

Map<String, dynamic> _$CertificateModelToJson(_CertificateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userResumeId': instance.userResumeId,
      'displayOrder': instance.displayOrder,
      'name': instance.name,
      'certificatedAt': instance.certificatedAt,
      'certificateLink': instance.certificateLink,
    };
