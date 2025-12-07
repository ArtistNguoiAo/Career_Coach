import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/skill_entity.dart';
import 'package:career_coach/domain/use_case/get_skills_use_case.dart';
import 'package:career_coach/domain/use_case/save_skills_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'skill_state.dart';

class SkillCubit extends Cubit<SkillState> {
  SkillCubit() : super(SkillState());

  final getSkillsUseCase = getIt<GetSkillsUseCase>();
  final saveSkillsUseCase = getIt<SaveSkillsUseCase>();

  Future<void> init({required int userResumeId}) async {
    await Future.delayed(Duration(milliseconds: 300));
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final listSkill = await getSkillsUseCase(userResumeId: userResumeId);
      emit(state.copyWith(listSkill: listSkill, isLoading: false, error: ''));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> save({required int userResumeId}) async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      for (final it in state.listSkill) {
        if (it.name.trim().isEmpty) {
          emit(state.copyWith(isLoading: false, error: 'Skill name cannot be empty.'));
          return;
        }
      }
      await saveSkillsUseCase.call(
        userResumeId: userResumeId,
        listSkill: state.listSkill,
      );
      final listSkill = await getSkillsUseCase(userResumeId: userResumeId);
      emit(
        state.copyWith(
          listSkill: listSkill,
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

  Future<void> addSkill() async {
    final newSkill = SkillEntity(
      id: 0,
      userResumeId: 0,
      displayOrder: state.listSkill.length,
      name: '',
      description: '',
    );
    final updatedList = List<SkillEntity>.from(state.listSkill)..add(newSkill);
    emit(state.copyWith(listSkill: updatedList));
  }

  Future<void> deleteSkill(int index) async {
    final updatedList = List<SkillEntity>.from(state.listSkill)..removeAt(index);
    for (int i = 0; i < updatedList.length; i++) {
      updatedList[i].displayOrder = i;
    }
    emit(state.copyWith(listSkill: updatedList));
  }

  Future<void> changeSkill(int oldIndex, int newIndex) async {
    if (newIndex < 0 || newIndex >= state.listSkill.length) return;
    final updatedList = List<SkillEntity>.from(state.listSkill);
    final skill = updatedList.removeAt(oldIndex);
    updatedList.insert(newIndex, skill);
    for (int i = 0; i < updatedList.length; i++) {
      updatedList[i].displayOrder = i;
    }
    emit(state.copyWith(listSkill: updatedList));
  }
}
