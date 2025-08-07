part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginLoaded extends LoginState {
  final String login;
  final String password;
  final bool rememberMe;

  LoginLoaded({
    required this.login,
    required this.password,
    required this.rememberMe,
  });
}

final class LoginSuccess extends LoginState {}

final class LoginError extends LoginState {
  final String message;

  LoginError({
    required this.message,
  });
}