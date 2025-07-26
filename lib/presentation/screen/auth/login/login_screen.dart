import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/media_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/auth_background.dart';
import 'package:career_coach/presentation/core/widgets/base_text_field.dart';
import 'package:career_coach/presentation/screen/auth/login/cubit/login_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit()..init(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Stack(children: [AuthBackground(), _loginForm()]),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoaded) {
          _loginController.text = state.login;
          _passwordController.text = state.password;
          _rememberMe = state.rememberMe;
        }
        if (state is LoginSuccess) {
          DialogUtils.hideLoadingDialog(context);
          AutoRouter.of(context).replaceAll([const OverViewRoute()]);
        }
        if (state is LoginLoading) {
          DialogUtils.showLoadingDialog(context);
        }
        if (state is LoginError) {
          DialogUtils.hideLoadingDialog(context);
          DialogUtils.showErrorDialog(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: context.theme.backgroundColor, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: BaseTextField(
                      controller: _loginController,
                      labelText: '${context.language.email}/${context.language.phone}',
                      prefixIcon: Icon(FontAwesomeIcons.userTie, size: 16, color: context.theme.textColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: BaseTextField(
                      controller: _passwordController,
                      labelText: context.language.password,
                      obscureText: _isObscure,
                      prefixIcon: Icon(FontAwesomeIcons.lock, size: 16, color: context.theme.textColor),
                      suffixIcon: InkWell(
                        onTap: () => setState(() => _isObscure = !_isObscure),
                        child: Icon(
                          _isObscure ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                          size: 16,
                          color: context.theme.textColor,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        checkColor: context.theme.backgroundColor,
                        activeColor: context.theme.primaryColor,
                        splashRadius: 10,
                        onChanged: (value) => setState(() => _rememberMe = value ?? false),
                      ),
                      Text(
                        context.language.rememberMe,
                        style: TextStyleUtils.normal(color: context.theme.textColor, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<LoginCubit>().loginWithGoogle();
                        },
                        child: SvgPicture.asset(MediaUtils.icGoogle, height: 36, width: 36),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<LoginCubit>().loginWithGitHub(context);
                        },
                        child: SvgPicture.asset(MediaUtils.icGithub, height: 36, width: 36),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            context.language.forgotPassword,
                            style: TextStyleUtils.normal(color: context.theme.primaryColor, fontSize: 14),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.read<LoginCubit>().login(
                              login: _loginController.text,
                              password: _passwordController.text,
                              rememberMe: _rememberMe,
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
                              context.language.login,
                              textAlign: TextAlign.center,
                              style: TextStyleUtils.bold(color: context.theme.backgroundColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: context.language.haveAccount,
                style: TextStyleUtils.normal(color: context.theme.textColor, fontSize: 12),
                children: [
                  TextSpan(
                    text: " ${context.language.register}",
                    style: TextStyleUtils.normal(color: context.theme.primaryColor, fontSize: 14),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AutoRouter.of(context).push(RegisterRoute());
                      },
                  ),
                ],
              ),
            ),
            Text(
              '${context.language.version}: 1.0.0',
              style: TextStyleUtils.normal(color: context.theme.textColor, fontSize: 12),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
