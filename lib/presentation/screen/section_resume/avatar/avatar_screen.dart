import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_avatar.dart';
import 'package:career_coach/presentation/screen/section_resume/avatar/cubit/avatar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class AvatarScreen extends StatefulWidget {
  const AvatarScreen({super.key, required this.userResumeId});

  final int userResumeId;

  @override
  State<AvatarScreen> createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AvatarCubit()..getAvatar(widget.userResumeId),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              AutoRouter.of(context).maybePop();
            },
            child: Icon(FontAwesomeIcons.chevronLeft, color: context.theme.backgroundColor, size: 20),
          ),
          centerTitle: true,
          title: Text(
            context.language.avatar,
            style: TextStyleUtils.bold(color: context.theme.backgroundColor, fontSize: 18),
          ),
          backgroundColor: context.theme.primaryColor,
        ),
        body: BlocConsumer<AvatarCubit, AvatarState>(
          listener: (context, state) {
            if (state.isLoading) {
              DialogUtils.showLoadingDialog(context);
            } else {
              DialogUtils.hideLoadingDialog(context);
            }
            if (state.error.isNotEmpty) {
              DialogUtils.showErrorDialog(context: context, message: state.error);
              state.error = '';
            }
          },
          builder: (context, state) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: context.theme.backgroundColor,
              child: Column(
                children: [
                  SizedBox(height: 48.0),
                  BaseAvatar(
                    url: state.avatarEntity?.url ?? '',
                    size: 180,
                    padding: 30,
                    border: Border.all(color: context.theme.primaryColor, width: 2),
                  ),
                  SizedBox(height: 64.0),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? image;
                            image = await picker.pickImage(source: ImageSource.camera);
                            if(image != null) {
                              final file = File(image.path);
                              context.read<AvatarCubit>().saveAvatar(widget.userResumeId, file);
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: context.theme.primaryColor.withAlpha((255 * 0.1).round()),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              context.language.camera,
                              style: TextStyleUtils.bold(color: context.theme.primaryColor, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? image;
                            image = await picker.pickImage(source: ImageSource.gallery);
                            if(image != null) {
                              final file = File(image.path);
                              context.read<AvatarCubit>().saveAvatar(widget.userResumeId, file);
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: context.theme.primaryColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              context.language.gallery,
                              textAlign: TextAlign.center,
                              style: TextStyleUtils.bold(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
