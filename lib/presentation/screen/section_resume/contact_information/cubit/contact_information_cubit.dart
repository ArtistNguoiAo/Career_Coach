import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/contact_information_entity.dart';
import 'package:career_coach/domain/use_case/get_contact_information_use_case.dart';
import 'package:career_coach/domain/use_case/save_contact_information_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'contact_information_state.dart';

class ContactInformationCubit extends Cubit<ContactInformationState> {
  ContactInformationCubit() : super(ContactInformationState());

  final getContactInformationUseCase = getIt<GetContactInformationUseCase>();
  final saveContactInformationUseCase = getIt<SaveContactInformationUseCase>();

  Future<void> init({required int userResumeId}) async {
    try {
      final contactInformationEntity = await getContactInformationUseCase(userResumeId: userResumeId);
      emit(state.copyWith(contactInformationEntity: contactInformationEntity, isLoading: false, error: ''));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> save() async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      if(state.contactInformationEntity?.fullName.isEmpty ?? false) {
        emit(state.copyWith(isLoading: false, error: 'Please fill in all required fields.'));
        return;
      }
      final contactInformationEntity = await saveContactInformationUseCase.call(
        contactInformationEntity: state.contactInformationEntity!,
      );
      emit(
        state.copyWith(
          contactInformationEntity: contactInformationEntity,
          isLoading: false,
          isSavedSuccess: true,
          error: '',
        ),
      );
      emit(state.copyWith(isSavedSuccess: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
