// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_information_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactInformationModel _$ContactInformationModelFromJson(
  Map<String, dynamic> json,
) => _ContactInformationModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  userResumeId: (json['userResumeId'] as num?)?.toInt() ?? 0,
  fullName: json['fullName'] as String? ?? '',
  position: json['position'] as String? ?? '',
  email: json['email'] as String? ?? '',
  phoneNumber: json['phoneNumber'] as String? ?? '',
  address: json['address'] as String? ?? '',
  dateOfBirth: json['dateOfBirth'] as String? ?? '',
  portfolio: json['portfolio'] as String? ?? '',
  github: json['github'] as String? ?? '',
  linkedIn: json['linkedIn'] as String? ?? '',
  facebook: json['facebook'] as String? ?? '',
);

Map<String, dynamic> _$ContactInformationModelToJson(
  _ContactInformationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'userResumeId': instance.userResumeId,
  'fullName': instance.fullName,
  'position': instance.position,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'address': instance.address,
  'dateOfBirth': instance.dateOfBirth,
  'portfolio': instance.portfolio,
  'github': instance.github,
  'linkedIn': instance.linkedIn,
  'facebook': instance.facebook,
};
