import 'package:bloc/bloc.dart';
import 'package:career_coach/data/exception/api_exception.dart';
import 'package:career_coach/domain/use_case/register_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  final registerUseCase = getIt<RegisterUseCase>();

  Future<void> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    emit(
      state.copyWith(
        fullName: fullName,
        email: email,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword,
        isLoading: true,
      ),
    );
    try {
      if (password == confirmPassword) {
        await registerUseCase.call(
          fullName: fullName,
          email: email,
          phone: phone,
          password: password,
          avatar: '',
        );
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(state.copyWith(isLoading: false, error: "Passwords do not match"));
      }
    } on ApiException catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> updateObscurePassword({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    emit(
      state.copyWith(
        fullName: fullName,
        email: email,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword,
        isObscurePassword: !state.isObscurePassword,
      ),
    );
  }

  Future<void> updateObscureConfirmPassword({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    emit(
      state.copyWith(
        fullName: fullName,
        email: email,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword,
        isObscureConfirmPassword: !state.isObscureConfirmPassword,
      ),
    );
  }
}
