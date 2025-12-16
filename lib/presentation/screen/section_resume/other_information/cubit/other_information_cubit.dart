import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/other_information_entity.dart';
import 'package:career_coach/domain/use_case/get_other_information_use_case.dart';
import 'package:career_coach/domain/use_case/save_other_information_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'other_information_state.dart';

class OtherInformationCubit extends Cubit<OtherInformationState> {
  OtherInformationCubit() : super(OtherInformationState());

  final getOtherInformationUseCase = getIt<GetOtherInformationUseCase>();
  final saveOtherInformationUseCase = getIt<SaveOtherInformationUseCase>();

  Future<void> init({required int userResumeId}) async {
    await Future.delayed(Duration(milliseconds: 300));
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final otherInformationEntity = await getOtherInformationUseCase(userResumeId: userResumeId);
      emit(state.copyWith(otherInformationEntity: otherInformationEntity, isLoading: false, error: ''));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> save() async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      if(state.otherInformationEntity?.content.isEmpty ?? false) {
        emit(state.copyWith(isLoading: false, error: 'Please fill in all required fields.'));
        return;
      }
      final otherInformationEntity = await saveOtherInformationUseCase.call(
        otherInformationEntity: state.otherInformationEntity!,
      );
      emit(
        state.copyWith(
          otherInformationEntity: otherInformationEntity,
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
