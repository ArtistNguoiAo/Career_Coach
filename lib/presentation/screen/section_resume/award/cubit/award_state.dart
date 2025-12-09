part of 'award_cubit.dart';

class AwardState {
  final List<AwardEntity> listAward;
  final String error;
  final bool isLoading;
  final bool isSavedSuccess;

  AwardState({
    this.listAward = const [],
    this.error = '',
    this.isLoading = false,
    this.isSavedSuccess = false,
  });

  AwardState copyWith({
    List<AwardEntity>? listAward,
    String? error,
    bool? isLoading,
    bool? isSavedSuccess,
  }) {
    return AwardState(
      listAward: listAward ?? this.listAward,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      isSavedSuccess: isSavedSuccess ?? this.isSavedSuccess,
    );
  }
}
