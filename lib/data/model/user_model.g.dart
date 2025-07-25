// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String? ?? '',
  keycloakId: json['keycloakId'] as String? ?? '',
  fullName: json['fullName'] as String? ?? '',
  email: json['email'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
  avatar: json['avatar'] as String? ?? '',
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'keycloakId': instance.keycloakId,
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'avatar': instance.avatar,
    };
