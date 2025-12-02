import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/contact_information_entity.dart';
import 'package:career_coach/domain/use_case/get_contact_information_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'contact_information_state.dart';

class ContactInformationCubit extends Cubit<ContactInformationState> {
  ContactInformationCubit() : super(ContactInformationState());

  final getContactInformationUseCase = getIt<GetContactInformationUseCase>();

  Future<void> init({required int userResumeId}) async {
    try {
      final contactInformation = await getContactInformationUseCase(
        userResumeId: userResumeId,
      );
      emit(state.copyWith(
        contactInformation: contactInformation,
      ));
    } catch (e) {

    }
  }
}
