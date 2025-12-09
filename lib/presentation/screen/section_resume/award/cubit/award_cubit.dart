import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/award_entity.dart';
import 'package:career_coach/domain/use_case/get_awards_use_case.dart';
import 'package:career_coach/domain/use_case/save_awards_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'award_state.dart';

class AwardCubit extends Cubit<AwardState> {
  AwardCubit() : super(AwardState());

  final getAwardsUseCase = getIt<GetAwardsUseCase>();
  final saveAwardsUseCase = getIt<SaveAwardsUseCase>();

  Future<void> init({required int userResumeId}) async {
    await Future.delayed(Duration(milliseconds: 300));
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final listAward = await getAwardsUseCase(userResumeId: userResumeId);
      emit(state.copyWith(listAward: listAward, isLoading: false, error: ''));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> save({required int userResumeId}) async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      for (final it in state.listAward) {
        if (it.name.trim().isEmpty) {
          emit(state.copyWith(isLoading: false, error: 'Award name cannot be empty.'));
          return;
        }
      }
      await saveAwardsUseCase.call(
        userResumeId: userResumeId,
        listAward: state.listAward,
      );
      final listAward = await getAwardsUseCase(userResumeId: userResumeId);
      emit(
        state.copyWith(
          listAward: listAward,
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

  Future<void> addAward() async {
    final newAward = AwardEntity(
      id: 0,
      userResumeId: 0,
      displayOrder: state.listAward.length,
      name: '',
      awardedAt: '',
    );
    final updatedList = List<AwardEntity>.from(state.listAward)..add(newAward);
    emit(state.copyWith(listAward: updatedList));
  }

  Future<void> deleteAward(int index) async {
    final updatedList = List<AwardEntity>.from(state.listAward)..removeAt(index);
    for (int i = 0; i < updatedList.length; i++) {
      updatedList[i].displayOrder = i;
    }
    emit(state.copyWith(listAward: updatedList));
  }

  Future<void> changeAward(int oldIndex, int newIndex) async {
    if (newIndex < 0 || newIndex >= state.listAward.length) return;
    final updatedList = List<AwardEntity>.from(state.listAward);
    final item = updatedList.removeAt(oldIndex);
    updatedList.insert(newIndex, item);
    for (int i = 0; i < updatedList.length; i++) {
      updatedList[i].displayOrder = i;
    }
    emit(state.copyWith(listAward: updatedList));
  }
}
