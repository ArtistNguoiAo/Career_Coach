import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/auth_background.dart';
import 'package:career_coach/presentation/core/widgets/base_text_field.dart';
import 'package:career_coach/presentation/screen/auth/register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: Stack(children: [AuthBackground(), _registerForm()]),
      ),
    );
  }

  Widget _registerForm() {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.isLoading) {
          DialogUtils.showLoadingDialog(context);
        } else {
          DialogUtils.hideLoadingDialog(context);
        }
        if (state.isSuccess) {
          DialogUtils.hideLoadingDialog(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                context.language.registerSuccess,
                style: TextStyleUtils.normal(
                  color: context.theme.backgroundColor,
                  fontSize: 12,
                ),
              ),
              backgroundColor: context.theme.goodColor,
              duration: const Duration(seconds: 1),
            ),
          );
          AutoRouter.of(context).maybePop();
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.theme.backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: BaseTextField(
                      controller: _fullNameController,
                      labelText: context.language.fullName,
                      prefixIcon: Icon(
                        FontAwesomeIcons.signature,
                        size: 16,
                        color: context.theme.textColor,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: BaseTextField(
                      controller: _emailController,
                      labelText: context.language.email,
                      prefixIcon: Icon(
                        FontAwesomeIcons.envelope,
                        size: 16,
                        color: context.theme.textColor,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: BaseTextField(
                      controller: _phoneController,
                      labelText: context.language.phone,
                      prefixIcon: Icon(
                        FontAwesomeIcons.phone,
                        size: 16,
                        color: context.theme.textColor,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: BaseTextField(
                      controller: _passwordController,
                      labelText: context.language.password,
                      obscureText: state.isObscurePassword,
                      prefixIcon: Icon(
                        FontAwesomeIcons.lock,
                        size: 16,
                        color: context.theme.textColor,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          context.read<RegisterCubit>().updateObscurePassword(
                            fullName: _fullNameController.text,
                            email: _emailController.text,
                            phone: _phoneController.text,
                            password: _passwordController.text,
                            confirmPassword: _confirmPasswordController.text,
                          );
                        },
                        child: Icon(
                          state.isObscurePassword
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          size: 16,
                          color: context.theme.textColor,
                        ),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: BaseTextField(
                      controller: _confirmPasswordController,
                      labelText: context.language.confirmPassword,
                      obscureText: state.isObscureConfirmPassword,
                      prefixIcon: Icon(
                        FontAwesomeIcons.lock,
                        size: 16,
                        color: context.theme.textColor,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          context
                              .read<RegisterCubit>()
                              .updateObscureConfirmPassword(
                                fullName: _fullNameController.text,
                                email: _emailController.text,
                                phone: _phoneController.text,
                                password: _passwordController.text,
                                confirmPassword:
                                    _confirmPasswordController.text,
                              );
                        },
                        child: Icon(
                          state.isObscureConfirmPassword
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          size: 16,
                          color: context.theme.textColor,
                        ),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if(state.error.isNotEmpty)...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        state.error,
                        style: TextStyleUtils.normal(
                          fontSize: 14,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.read<RegisterCubit>().register(
                              fullName: _fullNameController.text,
                              email: _emailController.text,
                              phone: _phoneController.text,
                              password: _passwordController.text,
                              confirmPassword: _confirmPasswordController.text,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: context.theme.primaryColor,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
                            ),
                            child: Text(
                              context.language.register,
                              textAlign: TextAlign.center,
                              style: TextStyleUtils.bold(
                                color: context.theme.backgroundColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                AutoRouter.of(context).maybePop();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.language.back,
                    style: TextStyleUtils.normal(
                      color: context.theme.primaryColor,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    FontAwesomeIcons.arrowRight,
                    size: 14,
                    color: context.theme.primaryColor,
                  ),
                ],
              ),
            ),
            Text(
              '${context.language.version}: 1.0.0',
              style: TextStyleUtils.normal(
                color: context.theme.textColor,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
