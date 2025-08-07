import 'package:bloc/bloc.dart';
import 'package:career_coach/data/exception/api_exception.dart';
import 'package:career_coach/domain/use_case/register_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final registerUseCase = getIt<RegisterUseCase>();

  Future<void> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    emit(RegisterLoading());
    try {
      if (password == confirmPassword) {
        await registerUseCase.call(
          fullName: fullName,
          email: email,
          phone: phone,
          password: password,
          avatar: '',
        );
        emit(RegisterSuccess());
      } else {
        emit(RegisterError(message: '[error] Passwords do not match'));
      }
    }
    on ApiException catch (e) {
      emit(RegisterError(message: e.toString()));
    }
    catch (e) {
      emit(RegisterError(message: e.toString()));
    }
  }
}
