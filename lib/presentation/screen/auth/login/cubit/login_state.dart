part of 'login_cubit.dart';

class LoginState {
  final String login;
  final String password;
  final bool rememberMe;
  final bool isObscure;
  final bool isLoading;
  final String error;
  final bool isSuccess;

  LoginState({
    this.login = '',
    this.password = '',
    this.rememberMe = false,
    this.isObscure = true,
    this.isLoading = false,
    this.error = '',
    this.isSuccess = false,
  });

  LoginState copyWith({
    String? login,
    String? password,
    bool? rememberMe,
    bool? isObscure,
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return LoginState(
      login: login ?? this.login,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      isObscure: isObscure ?? this.isObscure,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}