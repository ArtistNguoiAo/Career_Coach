import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/favorite_entity.dart';
import 'package:career_coach/domain/use_case/get_favorites_use_case.dart';
import 'package:career_coach/domain/use_case/save_favorites_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteState());

  final getFavoritesUseCase = getIt<GetFavoritesUseCase>();
  final saveFavoritesUseCase = getIt<SaveFavoritesUseCase>();

  Future<void> init({required int userResumeId}) async {
    await Future.delayed(Duration(milliseconds: 300));
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final listFavorite = await getFavoritesUseCase(userResumeId: userResumeId);
      emit(state.copyWith(listFavorite: listFavorite, isLoading: false, error: ''));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> save({required int userResumeId}) async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      for (final it in state.listFavorite) {
        if (it.name.isEmpty) {
          emit(state.copyWith(isLoading: false, error: 'Favorite name cannot be empty.'));
          return;
        }
      }
      await saveFavoritesUseCase.call(
        userResumeId: userResumeId,
        listFavorite: state.listFavorite,
      );
      final listFavorite = await getFavoritesUseCase(userResumeId: userResumeId);
      emit(
        state.copyWith(
          listFavorite: listFavorite,
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

  Future<void> addFavorite() async {
    final newFavorite = FavoriteEntity(
      id: 0,
      userResumeId: 0,
      displayOrder: state.listFavorite.length,
      name: '',
    );
    final updatedList = List<FavoriteEntity>.from(state.listFavorite)..add(newFavorite);
    emit(state.copyWith(listFavorite: updatedList));
  }

  Future<void> deleteFavorite(int index) async {
    final updatedList = List<FavoriteEntity>.from(state.listFavorite)..removeAt(index);
    emit(state.copyWith(listFavorite: updatedList));
  }

  Future<void> changeFavorite(int oldIndex, int newIndex) async {
    if (newIndex < 0 || newIndex >= state.listFavorite.length) return;
    final updatedList = List<FavoriteEntity>.from(state.listFavorite);
    final item = updatedList.removeAt(oldIndex);
    updatedList.insert(newIndex, item);
    for (int i = 0; i < updatedList.length; i++) {
      updatedList[i].displayOrder = i;
    }
    emit(state.copyWith(listFavorite: updatedList));
  }
}
