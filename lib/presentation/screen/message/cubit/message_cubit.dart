import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/message_entity.dart';
import 'package:career_coach/domain/use_case/get_list_message_interview_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageState());

  final getListMessageInterviewUseCase = getIt<GetListMessageInterviewUseCase>();

  Future<void> init(int sessionId) async {
    final result = await getListMessageInterviewUseCase.call(
      sessionId: sessionId,
      page: 0,
      size: 50,
    );
    final listMessage = result.reversed.toList();
    emit(state.copyWith(listMessage: listMessage));
  }
}
