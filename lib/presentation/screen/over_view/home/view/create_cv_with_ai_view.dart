import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/user_resume_recent_entity.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/media_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_text_field.dart';
import 'package:career_coach/presentation/screen/over_view/home/view/title_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class CreateCvWithAIView extends StatefulWidget {
  const CreateCvWithAIView({super.key, required this.listUserResumeRecent});

  final List<UserResumeRecentEntity> listUserResumeRecent;

  @override
  State<CreateCvWithAIView> createState() => _CreateCvWithAIViewState();
}

class _CreateCvWithAIViewState extends State<CreateCvWithAIView> {
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleView(title: context.language.createCvWithAI),
        const SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Lottie.asset(MediaUtils.ltBot, width: 80, fit: BoxFit.cover),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  context.language.createCvWithAIContent,
                  style: TextStyleUtils.normal(color: context.theme.primaryDarkColor, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BaseTextField(
            controller: _contentController,
            textInputAction: TextInputAction.newline,
            hintText: context.language.description,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: context.theme.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: context.theme.primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: context.theme.borderColor),
            ),
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () {
            DialogUtils.showCreateResumeWithAIDialog(
              context: context,
              listUserResumeRecent: widget.listUserResumeRecent,
              onCreate: (selectedResume) {
                AutoRouter.of(context).push(
                  PreviewResumeRoute(
                    isCreateNew: true,
                    isCreateWithAI: true,
                    content: _contentController.text.trim(),
                    sourceUserResumeId: selectedResume?.id,
                  ),
                );
              },
            );
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(color: context.theme.primaryColor, borderRadius: BorderRadius.circular(4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.wandMagicSparkles, color: Colors.white, size: 16),
                const SizedBox(width: 8),
                Text(context.language.create, style: TextStyleUtils.bold(color: Colors.white, fontSize: 16)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
