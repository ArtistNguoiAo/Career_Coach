import 'package:bloc/bloc.dart';
import 'package:career_coach/data/exception/api_exception.dart';
import 'package:career_coach/data/local/local_cache.dart';
import 'package:career_coach/domain/use_case/login_use_case.dart';
import 'package:career_coach/domain/use_case/google_login_use_case.dart';
import 'package:career_coach/domain/use_case/github_login_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  final loginUseCase = getIt<LoginUseCase>();
  final googleLoginUseCase = getIt<GoogleLoginUseCase>();
  final githubLoginUseCase = getIt<GitHubLoginUseCase>();

  Future<void> init() async {
    final login = await LocalCache.getString(StringCache.login);
    final password = await LocalCache.getString(StringCache.password);
    final rememberMe = await LocalCache.getBool(StringCache.rememberMe);
    emit(
      state.copyWith(login: login, password: password, rememberMe: rememberMe),
    );
  }

  Future<void> updateRememberMe({
    required String login,
    required String password,
  }) async {
    emit(
      state.copyWith(
        login: login,
        password: password,
        rememberMe: !state.rememberMe,
      ),
    );
  }

  Future<void> updateObscure({
    required String login,
    required String password,
  }) async {
    emit(
      state.copyWith(
        login: login,
        password: password,
        isObscure: !state.isObscure,
      ),
    );
  }

  Future<void> login({
    required String login,
    required String password,
    required bool rememberMe,
  }) async {
    emit(
      state.copyWith(
        login: login,
        password: password,
        rememberMe: rememberMe,
        isLoading: true,
      ),
    );
    try {
      final authEntity = await loginUseCase.call(
        login: login,
        password: password,
      );
      await LocalCache.setString(
        StringCache.accessToken,
        authEntity.accessToken,
      );
      await LocalCache.setString(
        StringCache.refreshToken,
        authEntity.refreshToken,
      );
      if (rememberMe) {
        await LocalCache.setString(StringCache.login, login);
        await LocalCache.setString(StringCache.password, password);
        await LocalCache.setBool(StringCache.rememberMe, true);
      } else {
        await LocalCache.setString(StringCache.login, '');
        await LocalCache.setString(StringCache.password, '');
        await LocalCache.setBool(StringCache.rememberMe, false);
      }
      await LocalCache.setBool(StringCache.isLoggedIn, true);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          login: login,
          password: password,
          rememberMe: rememberMe,
          isLoading: false,
          error: e.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          login: login,
          password: password,
          rememberMe: rememberMe,
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> loginWithGoogle() async {
    emit(state.copyWith(isLoading: true));
    try {
      final authEntity = await googleLoginUseCase.call();
      await LocalCache.setString(
        StringCache.accessToken,
        authEntity.accessToken,
      );
      await LocalCache.setString(
        StringCache.refreshToken,
        authEntity.refreshToken,
      );
      await LocalCache.setBool(StringCache.isLoggedIn, true);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } on ApiException catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: 'Google Sign In failed: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> loginWithGitHub(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {
      final authEntity = await githubLoginUseCase.call(context);
      await LocalCache.setString(
        StringCache.accessToken,
        authEntity.accessToken,
      );
      await LocalCache.setString(
        StringCache.refreshToken,
        authEntity.refreshToken,
      );
      await LocalCache.setBool(StringCache.isLoggedIn, true);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } on ApiException catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: 'GitHub Sign In failed: ${e.toString()}',
        ),
      );
    }
  }
}
