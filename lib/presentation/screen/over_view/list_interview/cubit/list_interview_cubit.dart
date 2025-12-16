import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/interview_entity.dart';
import 'package:career_coach/domain/use_case/get_list_interview_active_use_case.dart';
import 'package:career_coach/domain/use_case/get_list_interview_history_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'list_interview_state.dart';

class ListInterviewCubit extends Cubit<ListInterviewState> {
  ListInterviewCubit() : super(ListInterviewState());

  final getListInterviewActiveUseCase = getIt<GetListInterviewActiveUseCase>();
  final getListInterviewHistoryUseCase = getIt<GetListInterviewHistoryUseCase>();

  Future<void> init() async {
    final activeInterviews = await getListInterviewActiveUseCase.call(
      page: 0,
      size: 100,
    );
    final historyInterviews = await getListInterviewHistoryUseCase.call(
      page: 0,
      size: 100,
    );

    emit(state.copyWith(
      listInterviewActive: activeInterviews,
      listInterviewHistory: historyInterviews,
    ));
  }
}
