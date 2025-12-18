// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageModel _$MessageModelFromJson(Map<String, dynamic> json) =>
    _MessageModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      sessionId: (json['sessionId'] as num?)?.toInt() ?? 0,
      role: json['role'] as String? ?? "",
      content: json['content'] as String? ?? "",
      messageOrder: (json['messageOrder'] as num?)?.toInt() ?? 0,
      tokenCount: (json['tokenCount'] as num?)?.toInt() ?? 0,
      latencyMs: (json['latencyMs'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] as String? ?? "",
    );

Map<String, dynamic> _$MessageModelToJson(_MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionId': instance.sessionId,
      'role': instance.role,
      'content': instance.content,
      'messageOrder': instance.messageOrder,
      'tokenCount': instance.tokenCount,
      'latencyMs': instance.latencyMs,
      'createdAt': instance.createdAt,
    };
