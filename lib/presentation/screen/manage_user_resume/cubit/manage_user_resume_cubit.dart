import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/enum/type_resume_created_enum.dart';
import 'package:career_coach/domain/use_case/delete_user_resume_batch_use_case.dart';
import 'package:career_coach/domain/use_case/delete_user_resume_use_case.dart';
import 'package:career_coach/domain/use_case/get_list_user_resume_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'manage_user_resume_state.dart';

class ManageUserResumeCubit extends Cubit<ManageUserResumeState> {
  ManageUserResumeCubit() : super(ManageUserResumeState());

  final GetListUserResumeUseCase getListUserResumeUseCase = getIt<GetListUserResumeUseCase>();
  final DeleteUserResumeUseCase deleteUserResumeUseCase = getIt<DeleteUserResumeUseCase>();
  final DeleteUserResumeBatchUseCase deleteUserResumeBatchUseCase = getIt<DeleteUserResumeBatchUseCase>();

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));

    try {
      final listUserResumeSaved = await getListUserResumeUseCase.call(
        page: 0,
        size: state.pageSize,
        status: TypeResumeCreatedEnum.SAVED.name,
      );

      final listUserResumeDraft = await getListUserResumeUseCase.call(
        page: 0,
        size: state.pageSize,
        status: TypeResumeCreatedEnum.DRAFT.name,
      );

      emit(
        state.copyWith(
          listUserResumeSaved: listUserResumeSaved,
          listUserResumeDraft: listUserResumeDraft,
          currentPageSaved: 0,
          currentPageDraft: 0,
          hasReachedMaxSaved: listUserResumeSaved.length < state.pageSize,
          hasReachedMaxDraft: listUserResumeDraft.length < state.pageSize,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      rethrow;
    }
  }

  Future<void> loadMoreSavedUserResume() async {
    if (state.isLoadingMore || state.hasReachedMaxSaved) return;

    emit(state.copyWith(isLoadingMore: true));

    try {
      final nextPage = state.currentPageSaved + 1;
      final newSaved = await getListUserResumeUseCase.call(
        page: nextPage,
        size: state.pageSize,
        status: TypeResumeCreatedEnum.SAVED.name,
      );

      emit(
        state.copyWith(
          listUserResumeSaved: [...state.listUserResumeSaved, ...newSaved],
          currentPageSaved: nextPage,
          hasReachedMaxSaved: newSaved.length < state.pageSize,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoadingMore: false));
      rethrow;
    }
  }

  Future<void> loadMoreDraftUserResume() async {
    if (state.isLoadingMore || state.hasReachedMaxDraft) return;

    emit(state.copyWith(isLoadingMore: true));

    try {
      final nextPage = state.currentPageSaved + 1;
      final newDraft = await getListUserResumeUseCase.call(
        page: nextPage,
        size: state.pageSize,
        status: TypeResumeCreatedEnum.DRAFT.name,
      );

      emit(
        state.copyWith(
          listUserResumeDraft: [...state.listUserResumeDraft, ...newDraft],
          currentPageSaved: nextPage,
          hasReachedMaxDraft: newDraft.length < state.pageSize,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoadingMore: false));
      rethrow;
    }
  }
}
