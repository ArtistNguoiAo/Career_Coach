part of 'message_cubit.dart';

class MessageState {
  final List<MessageEntity> listMessage;
  final bool isLoading;
  final String errorMessage;
  final bool isEndInterviewSuccess;
  final TypeInterviewStatusEnum status;
  final bool isLoadingTotal;

  MessageState({
    this.listMessage = const [],
    this.isLoading = false,
    this.errorMessage = '',
    this.isEndInterviewSuccess = false,
    this.status = TypeInterviewStatusEnum.ACTIVE,
    this.isLoadingTotal = false,
  });

  MessageState copyWith({
    List<MessageEntity>? listMessage,
    bool? isLoading,
    String? errorMessage,
    bool? isEndInterviewSuccess,
    TypeInterviewStatusEnum? status,
    bool? isLoadingTotal,
  }) {
    return MessageState(
      listMessage: listMessage ?? this.listMessage,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isEndInterviewSuccess: isEndInterviewSuccess ?? this.isEndInterviewSuccess,
      status: status ?? this.status,
      isLoadingTotal: isLoadingTotal ?? this.isLoadingTotal,
    );
  }
}
