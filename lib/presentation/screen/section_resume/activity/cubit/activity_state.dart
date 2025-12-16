part of 'activity_cubit.dart';

class ActivityState {
  final List<ActivityEntity> listActivity;
  String error;
  final bool isLoading;
  final bool isSavedSuccess;

  ActivityState({
    this.listActivity = const [],
    this.error = '',
    this.isLoading = false,
    this.isSavedSuccess = false,
  });

  ActivityState copyWith({
    List<ActivityEntity>? listActivity,
    String? error,
    bool? isLoading,
    bool? isSavedSuccess,
  }) {
    return ActivityState(
      listActivity: listActivity ?? this.listActivity,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      isSavedSuccess: isSavedSuccess ?? this.isSavedSuccess,
    );
  }
}
