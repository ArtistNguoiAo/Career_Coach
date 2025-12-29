part of 'analysis_cubit.dart';

class AnalysisState {
  final AnalysisEntity? analysisEntity;
  final bool isLoading;
  String error;

  AnalysisState({
    this.analysisEntity,
    this.isLoading = false,
    this.error = '',
  });

  AnalysisState copyWith({
    AnalysisEntity? analysisEntity,
    bool? isLoading,
    String? error,
  }) {
    return AnalysisState(
      analysisEntity: analysisEntity ?? this.analysisEntity,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
