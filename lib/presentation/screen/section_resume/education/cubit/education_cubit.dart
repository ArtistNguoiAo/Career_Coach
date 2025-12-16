import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/education_entity.dart';
import 'package:career_coach/domain/use_case/get_educations_use_case.dart';
import 'package:career_coach/domain/use_case/save_educations_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  EducationCubit() : super(EducationState());

  final getEducationsUseCase = getIt<GetEducationsUseCase>();
  final saveEducationsUseCase = getIt<SaveEducationsUseCase>();

  Future<void> init({required int userResumeId}) async {
    await Future.delayed(Duration(milliseconds: 300));
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final listEducation = await getEducationsUseCase(userResumeId: userResumeId);
      emit(state.copyWith(listEducation: listEducation, isLoading: false, error: ''));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> save({required int userResumeId}) async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      for (final it in state.listEducation) {
        if (it.school.isEmpty) {
          emit(state.copyWith(isLoading: false, error: 'School cannot be empty.'));
          return;
        }
      }
      await saveEducationsUseCase.call(
        userResumeId: userResumeId,
        listEducation: state.listEducation,
      );
      final listEducation = await getEducationsUseCase(userResumeId: userResumeId);
      emit(
        state.copyWith(
          listEducation: listEducation,
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

  Future<void> addEducation() async {
    final newEducation = EducationEntity(
      id: 0,
      userResumeId: 0,
      displayOrder: state.listEducation.length,
      school: '',
      degree: '',
      major: '',
      startTime: '',
      endTime: '',
      description: '',
    );
    final updatedList = List<EducationEntity>.from(state.listEducation)..add(newEducation);
    emit(state.copyWith(listEducation: updatedList));
  }

  Future<void> deleteEducation(int index) async {
    final updatedList = List<EducationEntity>.from(state.listEducation)..removeAt(index);
    emit(state.copyWith(listEducation: updatedList));
  }

  Future<void> changeEducation(int oldIndex, int newIndex) async {
    if (newIndex < 0 || newIndex >= state.listEducation.length) return;
    final updatedList = List<EducationEntity>.from(state.listEducation);
    final item = updatedList.removeAt(oldIndex);
    updatedList.insert(newIndex, item);
    for (int i = 0; i < updatedList.length; i++) {
      updatedList[i].displayOrder = i;
    }
    emit(state.copyWith(listEducation: updatedList));
  }
}
