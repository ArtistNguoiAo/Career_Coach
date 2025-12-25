import 'package:bloc/bloc.dart';
import 'package:career_coach/data/service/interview_socket_service.dart';
import 'package:career_coach/domain/entity/message_entity.dart';
import 'package:career_coach/domain/enum/type_interview_status_enum.dart';
import 'package:career_coach/domain/enum/type_message_role_enum.dart';
import 'package:career_coach/domain/use_case/end_interview_use_case.dart';
import 'package:career_coach/domain/use_case/get_list_message_interview_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageState());

  final getListMessageInterviewUseCase = getIt<GetListMessageInterviewUseCase>();
  final endInterviewUseCase = getIt<EndInterviewUseCase>();

  final InterviewSocketService _socketService = InterviewSocketService();
  int _sessionId = 0;

  Future<void> init(int sessionId, TypeInterviewStatusEnum status) async {
    _sessionId = sessionId;

    final listMessage = await getListMessageInterviewUseCase.call(sessionId: sessionId);
    emit(state.copyWith(listMessage: listMessage.reversed.toList(), status: status));

    _socketService.connect(sessionId: sessionId, onMessage: _onReceiveMessage);
  }

  void _onReceiveMessage(Map<String, dynamic> json) {
    final content = json['assistantMessage'].toString();
    final isLastMessage = json['shouldEnd'] as bool? ?? false;
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

    if(isLastMessage) {
      emit(
        state.copyWith(
          listMessage: listNewMessage.reversed.toList(),
          isEndInterviewSuccess: true,
          status: TypeInterviewStatusEnum.COMPLETED,
          isLoading: false,
        ),
      );
    }
    else {
      emit(state.copyWith(listMessage: listNewMessage.reversed.toList(), isLoading: false));
    }
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

    _socketService.sendMessage(sessionId: _sessionId, content: content);
  }

  Future<void> endInterview() async {
    emit(state.copyWith(isLoadingTotal: true, errorMessage: ''));
    try {
      await endInterviewUseCase.call(sessionId: _sessionId);
      final listMessage = await getListMessageInterviewUseCase.call(sessionId: _sessionId);
      emit(
        state.copyWith(
          listMessage: listMessage.reversed.toList(),
          isEndInterviewSuccess: true,
          status: TypeInterviewStatusEnum.COMPLETED,
          isLoadingTotal: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoadingTotal: false));
    }
  }

  @override
  Future<void> close() {
    _socketService.disconnect();
    return super.close();
  }
}
