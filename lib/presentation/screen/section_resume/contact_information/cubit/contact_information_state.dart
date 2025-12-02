part of 'contact_information_cubit.dart';

class ContactInformationState {
  final ContactInformationEntity? contactInformationEntity;
  final String error;
  final bool isLoading;
  final bool isSavedSuccess;

  ContactInformationState({
    this.contactInformationEntity,
    this.error = '',
    this.isLoading = false,
    this.isSavedSuccess = false,
  });

  ContactInformationState copyWith({
    ContactInformationEntity? contactInformationEntity,
    String? error,
    bool? isLoading,
    bool? isSavedSuccess,
  }) {
    return ContactInformationState(
      contactInformationEntity: contactInformationEntity ?? this.contactInformationEntity,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      isSavedSuccess: isSavedSuccess ?? this.isSavedSuccess,
    );
  }
}
