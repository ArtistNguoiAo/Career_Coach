import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  const factory MessageModel({
    @Default(0) int id,
    @Default(0) int sessionId,
    @Default("") String role,
    @Default("") String content,
    @Default(0) int messageOrder,
    @Default(0) int tokenCount,
    @Default(0) int latencyMs,
    @Default("") String createdAt,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);
}