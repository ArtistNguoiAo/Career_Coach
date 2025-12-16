part of 'other_information_cubit.dart';

class OtherInformationState {
  final OtherInformationEntity? otherInformationEntity;
  String error;
  final bool isLoading;
  final bool isSavedSuccess;

  OtherInformationState({
    this.otherInformationEntity,
    this.error = '',
    this.isLoading = false,
    this.isSavedSuccess = false,
  });

  OtherInformationState copyWith({
    OtherInformationEntity? otherInformationEntity,
    String? error,
    bool? isLoading,
    bool? isSavedSuccess,
  }) {
    return OtherInformationState(
      otherInformationEntity: otherInformationEntity ?? this.otherInformationEntity,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      isSavedSuccess: isSavedSuccess ?? this.isSavedSuccess,
    );
  }
}
