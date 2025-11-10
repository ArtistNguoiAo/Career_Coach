part of 'register_cubit.dart';

class RegisterState {
  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  final bool isObscurePassword;
  final bool isObscureConfirmPassword;
  final bool isLoading;
  final String error;
  final bool isSuccess;

  RegisterState({
    this.fullName = '',
    this.email = '',
    this.phone = '',
    this.password = '',
    this.confirmPassword = '',
    this.isObscurePassword = true,
    this.isObscureConfirmPassword = true,
    this.isLoading = false,
    this.error = '',
    this.isSuccess = false,
  });

  RegisterState copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? password,
    String? confirmPassword,
    bool? isObscurePassword,
    bool? isObscureConfirmPassword,
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return RegisterState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isObscurePassword: isObscurePassword ?? this.isObscurePassword,
      isObscureConfirmPassword:
          isObscureConfirmPassword ?? this.isObscureConfirmPassword,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}