import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/user_entity.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_avatar.dart';
import 'package:career_coach/presentation/screen/over_view/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            if (state is ProfileLogoutSuccess) {
              context.router.replaceAll([const LoginRoute()]);
            }
            if (state is ProfileDeleteAccountSuccess) {
              context.router.replaceAll([const LoginRoute()]);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    context.language.deleteAccountSuccess,
                    style: TextStyleUtils.normal(
                      color: context.theme.backgroundColor,
                      fontSize: 12,
                    ),
                  ),
                  backgroundColor: context.theme.goodColor,
                  duration: const Duration(seconds: 1),
                ),
              );
            }
            if (state is ProfileError) {
              DialogUtils.showErrorDialog(
                context: context,
                message: state.error,
              );
            }
          },
          builder: (context, state) {
            return Container(
              color: context.theme.backgroundColor,
              child: Column(
                children: [
                  if (state is ProfileLoaded) ...[
                    _header(state.userEntity, context),
                  ] else ...[
                    _header(
                      UserEntity(
                        fullName: "",
                        email: "",
                        phone: "",
                        avatar: "",
                        roles: [],
                      ),
                      context,
                    ),
                  ],
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        _featureProfile(context),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: context.theme.typeAccountColor,
                          ),
                          child: Text(
                            '${context.language.version}: 1.0.0',
                            style: TextStyleUtils.normal(
                              color: context.theme.textColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        _logoutButton(context),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _header(UserEntity userEntity, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: context.theme.primaryColor),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.theme.backgroundColor,
            ),
            child: BaseAvatar(
              url: userEntity.avatar,
              size: 100,
              padding: 16,
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
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        userEntity.fullName,
                        style: TextStyleUtils.bold(
                          fontSize: 18,
                          color: context.theme.backgroundColor,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        AutoRouter.of(context)
                            .push(ProfileUpdateRoute(userEntity: userEntity))
                            .then((value) {
                              if (value == true) {
                                context.read<ProfileCubit>().init();
                              }
                            });
                      },
                      child: Icon(
                        FontAwesomeIcons.penToSquare,
                        color: context.theme.backgroundColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.userLarge,
                      color: context.theme.backgroundColor,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      userEntity.email,
                      style: TextStyleUtils.normal(
                        color: context.theme.backgroundColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.phone,
                      color: context.theme.backgroundColor,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      userEntity.phone,
                      style: TextStyleUtils.normal(
                        color: context.theme.backgroundColor,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: context.theme.typeAccountColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    userEntity.roles.firstOrNull.toString(),
                    style: TextStyleUtils.normal(
                      color: context.theme.textColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureProfile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _basicProfile(
            title: context.language.workExperience,
            values: ["5 years", "2 years", "1 year"],
          ),
          SizedBox(height: 8),
          _basicProfile(
            title: context.language.professionalPosition,
            values: [],
          ),
          Container(
            height: 1,
            color: context.theme.borderColor,
            margin: EdgeInsets.symmetric(vertical: 16),
          ),
          _manageCvAndCl(),
          Container(
            height: 1,
            color: context.theme.borderColor,
            margin: EdgeInsets.symmetric(vertical: 16),
          ),
          Text(
            context.language.accountSettings,
            style: TextStyleUtils.bold(
              fontSize: 16,
              color: context.theme.textColor,
            ),
          ),
          _featureProfileItem(
            icon: FontAwesomeIcons.crown,
            iconColor: context.theme.premiumColor,
            title: context.language.upgradeToPremium,
            onTap: () {},
          ),
          _featureProfileItem(
            icon: FontAwesomeIcons.key,
            title: context.language.changePassword,
            onTap: () {},
          ),
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
          Container(
            height: 1,
            color: context.theme.borderColor,
            margin: EdgeInsets.symmetric(vertical: 16),
          ),
          Text(
            context.language.policyAndSupport,
            style: TextStyleUtils.bold(
              fontSize: 16,
              color: context.theme.textColor,
            ),
          ),
          _featureProfileItem(
            icon: FontAwesomeIcons.thumbsUp,
            title: context.language.appReview,
            onTap: () {},
          ),
          _featureProfileItem(
            icon: FontAwesomeIcons.reply,
            title: context.language.feedback,
            onTap: () {},
          ),
          _featureProfileItem(
            icon: FontAwesomeIcons.rotate,
            title: context.language.checkForNewUpdate,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _manageCvAndCl() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.theme.typeAccountColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.theme.backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    FontAwesomeIcons.briefcase,
                    color: context.theme.primaryColor,
                    size: 16,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        context.language.manageCv,
                        style: TextStyleUtils.bold(
                          fontSize: 16,
                          color: context.theme.textColor,
                        ),
                      ),
                    ),
                    Text(
                      "0",
                      style: TextStyleUtils.bold(
                        fontSize: 24,
                        color: context.theme.primaryDarkColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.theme.typeAccountColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.theme.backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    FontAwesomeIcons.briefcase,
                    color: context.theme.primaryColor,
                    size: 16,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        context.language.manageCl,
                        style: TextStyleUtils.bold(
                          fontSize: 16,
                          color: context.theme.textColor,
                        ),
                      ),
                    ),
                    Text(
                      "0",
                      style: TextStyleUtils.bold(
                        fontSize: 24,
                        color: context.theme.primaryDarkColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _basicProfile({required String title, required List<String> values}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyleUtils.bold(
                  fontSize: 16,
                  color: context.theme.textColor,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                context.language.edit,
                style: TextStyleUtils.bold(
                  fontSize: 16,
                  color: context.theme.primaryColor,
                ),
              ),
            ),
          ],
        ),
        if (values.isEmpty) ...[
          Text(
            context.language.notUpdate,
            style: TextStyleUtils.normal(
              fontSize: 16,
              color: context.theme.textColor,
            ),
          ),
        ] else ...[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(values.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: context.theme.primaryColor.withAlpha(
                        (255 * 0.1).round(),
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      values[index],
                      style: TextStyleUtils.normal(
                        fontSize: 16,
                        color: context.theme.primaryColor,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ],
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
            Icon(
              icon,
              color: iconColor ?? context.theme.iconFeatureColor,
              size: 20,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyleUtils.normal(
                  color: context.theme.textColor,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              FontAwesomeIcons.chevronRight,
              color: context.theme.iconFeatureColor,
              size: 20,
            ),
          ],
        ),
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
          Text(
            context.language.logout,
            style: TextStyleUtils.bold(color: context.theme.primaryDarkColor),
          ),
          const SizedBox(width: 8),
          Icon(
            FontAwesomeIcons.arrowRightFromBracket,
            color: context.theme.primaryDarkColor,
            size: 20,
          ),
        ],
      ),
    );
  }
}
