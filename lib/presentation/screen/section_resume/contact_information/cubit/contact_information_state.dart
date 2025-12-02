part of 'contact_information_cubit.dart';

class ContactInformationState {
  final ContactInformationEntity? contactInformation;

  ContactInformationState({this.contactInformation});

  ContactInformationState copyWith({
    ContactInformationEntity? contactInformation,
  }) {
    return ContactInformationState(
      contactInformation: contactInformation ?? this.contactInformation,
    );
  }
}
