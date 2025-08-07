import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/user_entity.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_content.dart';
import 'package:career_coach/presentation/screen/profile_update/cubit/profile_update_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key, required this.userEntity});

  final UserEntity userEntity;

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  var isChange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              AutoRouter.of(context).maybePop(isChange);
            },
            child: Icon(
              FontAwesomeIcons.chevronLeft,
              color: context.theme.backgroundColor,
              size: 24,
            ),
          ),
          centerTitle: true,
          title: Text(
            context.language.profileUpdate,
            style: TextStyleUtils.bold(
              color: context.theme.backgroundColor,
              fontSize: 20,
            ),
          ),
          backgroundColor: context.theme.primaryColor,
        ),
        body: BlocProvider(
          create: (context) =>
          ProfileUpdateCubit()
            ..init(widget.userEntity),
          child: BlocConsumer<ProfileUpdateCubit, ProfileUpdateState>(
            listener: (context, state) {
              if (state is ProfileUpdateLoaded) {
                _fullNameController.text = state.userEntity.fullName;
                _emailController.text = state.userEntity.email;
                _phoneController.text = state.userEntity.phone;
              }
              if (state is ProfileUpdateSuccess) {
                DialogUtils.hideLoadingDialog(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      context.language.updateProfileSuccess,
                      style: TextStyleUtils.normal(
                        color: context.theme.backgroundColor,
                        fontSize: 12
                      ),
                    ),
                    backgroundColor: context.theme.goodColor,
                    duration: const Duration(seconds: 1),
                  ),
                );
              }
              if (state is ProfileUpdateLoading) {
                DialogUtils.showLoadingDialog(context);
              }
              if (state is ProfileUpdateError) {
                DialogUtils.hideLoadingDialog(context);
                DialogUtils.showErrorDialog(context: context, message: state.message);
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    BaseContent(
                      controller: _fullNameController,
                      isRequired: false,
                      title: context.language.fullName,
                    ),
                    const SizedBox(height: 16),
                    BaseContent(
                      controller: _emailController,
                      isRequired: false,
                      title: context.language.email,
                    ),
                    const SizedBox(height: 16),
                    BaseContent(
                      controller: _phoneController,
                      isRequired: false,
                      title: context.language.phone,
                    ),
                    const SizedBox(height: 32),
                    InkWell(
                      onTap: () {
                        isChange = true;
                        context.read<ProfileUpdateCubit>().updateProfile(
                          fullName: _fullNameController.text,
                          email: _emailController.text,
                          phone: _phoneController.text,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: context.theme.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            context.language.save,
                            style: TextStyleUtils.bold(
                              color: context.theme.backgroundColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
    );
  }
}
