import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/analysis_entity.dart';
import 'package:career_coach/domain/use_case/get_analysis_interview_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'analysis_state.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  AnalysisCubit() : super(AnalysisState());

  final getAnalysisInterviewUseCase= getIt<GetAnalysisInterviewUseCase>();

  Future<void> init(int sessionId) async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final analysis = await getAnalysisInterviewUseCase(sessionId: sessionId);
      emit(state.copyWith(analysisEntity: analysis, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
