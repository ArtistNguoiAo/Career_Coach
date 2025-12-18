import 'package:bloc/bloc.dart';
import 'package:career_coach/data/service/interview_socket_service.dart';
import 'package:career_coach/domain/entity/message_entity.dart';
import 'package:career_coach/domain/enum/type_message_role_enum.dart';
import 'package:career_coach/domain/use_case/get_list_message_interview_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageState());

  final getListMessageInterviewUseCase = getIt<GetListMessageInterviewUseCase>();

  final InterviewSocketService _socketService = InterviewSocketService();
  int _sessionId = 0;

  Future<void> init(int sessionId) async {
    _sessionId = sessionId;

    final listMessage = await getListMessageInterviewUseCase.call(
      sessionId: sessionId,
      page: 0,
      size: 50,
    );
    emit(state.copyWith(listMessage: listMessage.reversed.toList()));

    _socketService.connect(
      sessionId: sessionId,
      onMessage: _onReceiveMessage,
    );
  }

  void _onReceiveMessage(Map<String, dynamic> json) {
    final content = json['assistantMessage'].toString();
    final listNewMessage = List<MessageEntity>.from(state.listMessage.reversed)
      ..add(
        MessageEntity(
          id: 0,
          sessionId: _sessionId,
          role: TypeMessageRoleEnum.ASSISTANT,
          content: content,
          messageOrder: 0,
          tokenCount: 0,
          latencyMs: 0,
          createdAt: DateTime.now().toIso8601String(),
        ),
      );

    emit(state.copyWith(
      listMessage: listNewMessage.reversed.toList(),
      isLoading: false,
    ));
  }

  Future<void> sendMessage(String content) async {
    final listNewMessage = List<MessageEntity>.from(state.listMessage.reversed)
      ..add(
        MessageEntity(
          id: 0,
          sessionId: _sessionId,
          role: TypeMessageRoleEnum.USER,
          content: content,
          messageOrder: 0,
          tokenCount: 0,
          latencyMs: 0,
          createdAt: DateTime.now().toIso8601String(),
        ),
      );

    emit(state.copyWith(listMessage: listNewMessage.reversed.toList()));
    await Future.delayed(const Duration(milliseconds: 200));
    emit(state.copyWith(isLoading: true));

    _socketService.sendMessage(
      sessionId: _sessionId,
      content: content,
    );
  }

  @override
  Future<void> close() {
    _socketService.disconnect();
    return super.close();
  }
}
