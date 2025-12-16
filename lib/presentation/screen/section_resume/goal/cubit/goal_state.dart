part of 'goal_cubit.dart';

class GoalState {
  final GoalEntity? goalEntity;
  String error;
  final bool isLoading;
  final bool isSavedSuccess;

  GoalState({
    this.goalEntity,
    this.error = '',
    this.isLoading = false,
    this.isSavedSuccess = false,
  });

  GoalState copyWith({
    GoalEntity? goalEntity,
    String? error,
    bool? isLoading,
    bool? isSavedSuccess,
  }) {
    return GoalState(
      goalEntity: goalEntity ?? this.goalEntity,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      isSavedSuccess: isSavedSuccess ?? this.isSavedSuccess,
    );
  }
}
