part of 'message_cubit.dart';

class MessageState {
  final List<MessageEntity> listMessage;
  final bool isLoading;

  MessageState({this.listMessage = const [], this.isLoading = false});

  MessageState copyWith({List<MessageEntity>? listMessage, bool? isLoading}) {
    return MessageState(
      listMessage: listMessage ?? this.listMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
