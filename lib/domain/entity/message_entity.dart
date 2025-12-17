import 'package:career_coach/domain/enum/type_message_role_enum.dart';

class MessageEntity {
  final int id;
  final int sessionId;
  final TypeMessageRoleEnum role;
  final String content;
  final int messageOrder;
  final int tokenCount;
  final int latencyMs;
  final String createdAt;

  MessageEntity({
    required this.id,
    required this.sessionId,
    required this.role,
    required this.content,
    required this.messageOrder,
    required this.tokenCount,
    required this.latencyMs,
    required this.createdAt,
  });
}
