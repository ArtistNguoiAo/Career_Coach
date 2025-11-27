import 'package:bloc/bloc.dart';
import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/enum/type_resume_created_enum.dart';
import 'package:career_coach/domain/use_case/get_list_user_resume_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';

part 'manage_user_resume_state.dart';

class ManageUserResumeCubit extends Cubit<ManageUserResumeState> {
  ManageUserResumeCubit() : super(ManageUserResumeState());

  final getListUserResumeUseCase = getIt<GetListUserResumeUseCase>();

  Future<void> init() async {
    final listUserResume = await getListUserResumeUseCase(
      page: 0,
      size: 10,
      status: TypeResumeCreatedEnum.SAVED.name,
    );
    emit(state.copyWith(listUserResume: listUserResume));
  }
}
