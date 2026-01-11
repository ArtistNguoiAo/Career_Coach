import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/user_entity.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/mode/language/inherited_language_widget.dart';
import 'package:career_coach/presentation/core/mode/theme/inherited_theme_widget.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/media_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_avatar.dart';
import 'package:career_coach/presentation/screen/over_view/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:career_coach/presentation/core/mode/theme/cubit/theme_cubit.dart';
import 'package:career_coach/presentation/core/mode/language/cubit/language_cubit.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..init(),
      child: Scaffold(
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state.isLogoutSuccess) {
              context.router.replaceAll([const LoginRoute()]);
            }
            if (state.isDeleteAccountSuccess) {
              context.router.replaceAll([const LoginRoute()]);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    context.language.deleteAccountSuccess,
                    style: TextStyleUtils.normal(color: Colors.white, fontSize: 12),
                  ),
                  backgroundColor: context.theme.goodColor,
                  duration: const Duration(seconds: 1),
                ),
              );
            }
            if (state.error.isNotEmpty) {
              DialogUtils.showErrorDialog(context: context, message: state.error);
              state.error = '';
            }
          },
          builder: (context, state) {
            return Container(
              color: context.theme.backgroundColor,
              child: Column(
                children: [
                  _header(state.userEntity, context),
                  _featureProfile(context),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: context.theme.typeAccountColor),
                    child: Text(
                      '${context.language.version}: 1.0.0',
                      style: TextStyleUtils.normal(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _logoutButton(context),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _header(UserEntity? userEntity, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(MediaUtils.imgProfileBackground), fit: BoxFit.cover),
      ),
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 16, left: 16, right: 16, bottom: 16),
        decoration: BoxDecoration(color: Colors.black.withAlpha((0.3 * 255).round())),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: BaseAvatar(
                url: userEntity?.avatar ?? '',
                size: 100,
                border: Border.all(color: Colors.white, width: 2),
                onTap: () {
                  DialogUtils.showChooseImageDialog(
                    context: context,
                    onClose: (avatar) {
                      context.read<ProfileCubit>().updateAvatar(avatar);
                    },
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          userEntity?.fullName ?? '',
                          style: TextStyleUtils.bold(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 8),
                      InkWell(
                        onTap: () {
                          if (userEntity == null) return;
                          AutoRouter.of(context).push(ProfileUpdateRoute(userEntity: userEntity)).then((value) {
                            if (value == true) {
                              context.read<ProfileCubit>().init();
                            }
                          });
                        },
                        child: Icon(FontAwesomeIcons.penToSquare, color: context.theme.backgroundColor, size: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.userLarge, color: Colors.white, size: 12),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          userEntity?.email ?? "",
                          style: TextStyleUtils.normal(color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.phone, color: Colors.white, size: 12),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          userEntity?.phone ?? "",
                          style: TextStyleUtils.normal(color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureProfile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              AutoRouter.of(context).push(ManageUserResumeRoute());
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: context.theme.lightGreyColor, borderRadius: BorderRadius.circular(4)),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: context.theme.backgroundColor, shape: BoxShape.circle),
                    child: Icon(FontAwesomeIcons.briefcase, color: context.theme.primaryColor, size: 16),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      context.language.manageCv,
                      style: TextStyleUtils.bold(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(height: 1, color: context.theme.borderColor, margin: EdgeInsets.symmetric(vertical: 16)),
          Text(
            context.language.accountSettings,
            style: TextStyleUtils.bold(fontSize: 16, color: context.theme.textColor),
          ),
          SizedBox(height: 8),
          _featureProfileItem(icon: FontAwesomeIcons.key, title: context.language.changePassword, onTap: () {}),
          SizedBox(height: 8),
          _languageSwitchItem(context),
          _themeSwitchItem(context),
          SizedBox(height: 8),
          _featureProfileItem(
            icon: FontAwesomeIcons.ban,
            title: context.language.deleteAccount,
            onTap: () {
              DialogUtils.showDeleteAccountDialog(
                context: context,
                onDelete: (check) {
                  context.read<ProfileCubit>().deleteAccount();
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _featureProfileItem({
    required IconData icon,
    Color? iconColor,
    required String title,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor ?? context.theme.darkGreyColor, size: 20),
            const SizedBox(width: 16),
            Expanded(
              child: Text(title, style: TextStyleUtils.normal(color: context.theme.textColor, fontSize: 16)),
            ),
            const SizedBox(width: 8),
            Icon(FontAwesomeIcons.chevronRight, color: context.theme.darkGreyColor, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _languageSwitchItem(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          Image.asset(
            context.read<LanguageCubit>().state.languageModeEnum == LanguageModeEnum.en
                ? MediaUtils.imgEn
                : MediaUtils.imgVi,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              context.language.language,
              style: TextStyleUtils.normal(color: context.theme.textColor, fontSize: 16),
            ),
          ),
          const SizedBox(width: 8),
          Switch(
            value: context.read<LanguageCubit>().state.languageModeEnum == LanguageModeEnum.en,
            onChanged: (value) {
              context.read<LanguageCubit>().changeLanguage(
                context.read<LanguageCubit>().state.languageModeEnum == LanguageModeEnum.en
                    ? LanguageModeEnum.vi
                    : LanguageModeEnum.en,
              );
            },
            activeColor: context.theme.primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _themeSwitchItem(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          Icon(
            context.read<ThemeCubit>().state.themeModeEnum == ThemeModeEnum.dark
                ? FontAwesomeIcons.moon
                : FontAwesomeIcons.sun,
            size: 20,
            color: context.theme.primaryColor,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              context.language.theme,
              style: TextStyleUtils.normal(color: context.theme.textColor, fontSize: 16),
            ),
          ),
          const SizedBox(width: 8),
          Switch(
            value: context.read<ThemeCubit>().state.themeModeEnum == ThemeModeEnum.dark,
            onChanged: (value) {
              context.read<ThemeCubit>().changeTheme(
                context.read<ThemeCubit>().state.themeModeEnum == ThemeModeEnum.light
                    ? ThemeModeEnum.dark
                    : ThemeModeEnum.light,
              );
            },
            activeColor: context.theme.primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _logoutButton(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ProfileCubit>().logout();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.language.logout, style: TextStyleUtils.bold(color: Colors.redAccent)),
          const SizedBox(width: 8),
          Icon(FontAwesomeIcons.arrowRightFromBracket, color: Colors.redAccent, size: 20),
        ],
      ),
    );
  }
}
