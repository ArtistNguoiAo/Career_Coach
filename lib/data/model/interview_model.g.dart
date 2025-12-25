// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InterviewModel _$InterviewModelFromJson(Map<String, dynamic> json) =>
    _InterviewModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userId: json['userId'] as String? ?? "",
      userResumeId: (json['userResumeId'] as num?)?.toInt() ?? 0,
      uploadedCvPath: json['uploadedCvPath'] as String? ?? "",
      cvSource: json['cvSource'] as String? ?? "",
      experienceLevel: json['experienceLevel'] as String? ?? "",
      status: json['status'] as String? ?? "",
      language: json['language'] as String? ?? "",
      conversationContext: json['conversationContext'] as String? ?? "",
      startTime: json['startTime'] as String? ?? "",
      endTime: json['endTime'] as String? ?? "",
      totalMessages: (json['totalMessages'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$InterviewModelToJson(_InterviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userResumeId': instance.userResumeId,
      'uploadedCvPath': instance.uploadedCvPath,
      'cvSource': instance.cvSource,
      'experienceLevel': instance.experienceLevel,
      'status': instance.status,
      'language': instance.language,
      'conversationContext': instance.conversationContext,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'totalMessages': instance.totalMessages,
    };
