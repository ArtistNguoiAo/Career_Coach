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
    emit(state.copyWith(isLoading: true));

    try {
      final activeInterviews = await getListInterviewActiveUseCase.call(page: 0, size: state.pageSize);

      final historyInterviews = await getListInterviewHistoryUseCase.call(page: 0, size: state.pageSize);

      emit(
        state.copyWith(
          listInterviewActive: activeInterviews,
          listInterviewHistory: historyInterviews,
          currentPageActive: 0,
          currentPageHistory: 0,
          hasReachedMaxActive: activeInterviews.length < state.pageSize,
          hasReachedMaxHistory: historyInterviews.length < state.pageSize,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      rethrow;
    }
  }

  Future<void> loadMoreActiveInterviews() async {
    if (state.isLoadingMore || state.hasReachedMaxActive) return;

    emit(state.copyWith(isLoadingMore: true));

    try {
      final nextPage = state.currentPageActive + 1;
      final newInterviews = await getListInterviewActiveUseCase.call(page: nextPage, size: state.pageSize);

      emit(
        state.copyWith(
          listInterviewActive: [...state.listInterviewActive, ...newInterviews],
          currentPageActive: nextPage,
          hasReachedMaxActive: newInterviews.length < state.pageSize,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoadingMore: false));
      rethrow;
    }
  }

  Future<void> loadMoreHistoryInterviews() async {
    if (state.isLoadingMore || state.hasReachedMaxHistory) return;

    emit(state.copyWith(isLoadingMore: true));

    try {
      final nextPage = state.currentPageHistory + 1;
      final newInterviews = await getListInterviewHistoryUseCase.call(page: nextPage, size: state.pageSize);

      emit(
        state.copyWith(
          listInterviewHistory: [...state.listInterviewHistory, ...newInterviews],
          currentPageHistory: nextPage,
          hasReachedMaxHistory: newInterviews.length < state.pageSize,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoadingMore: false));
      rethrow;
    }
  }
}
