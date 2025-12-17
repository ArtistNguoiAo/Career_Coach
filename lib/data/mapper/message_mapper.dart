import 'package:career_coach/data/model/message_model.dart';
import 'package:career_coach/domain/entity/message_entity.dart';
import 'package:career_coach/domain/enum/type_message_role_enum.dart';

class MessageMapper {
  static MessageEntity toEntity(MessageModel messageModel) {
    return MessageEntity(
      id: messageModel.id,
      sessionId: messageModel.sessionId,
      role: TypeMessageRoleEnumExtension.fromString(messageModel.role),
      content: messageModel.content,
      messageOrder: messageModel.messageOrder,
      tokenCount: messageModel.tokenCount,
      latencyMs: messageModel.latencyMs,
      createdAt: messageModel.createdAt,
    );
  }
}