import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_text_field.dart';
import 'package:career_coach/presentation/screen/preview_resume/cubit/preview_resume_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class PreviewResumeScreen extends StatefulWidget {
  const PreviewResumeScreen({super.key, this.resumeId, this.userResumeId, required this.isCreateNew});

  final int? resumeId;
  final int? userResumeId;
  final bool isCreateNew;

  @override
  State<PreviewResumeScreen> createState() => _PreviewResumeScreenState();
}

class _PreviewResumeScreenState extends State<PreviewResumeScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PreviewResumeCubit()
            ..init(resumeId: widget.resumeId, userResumeId: widget.userResumeId, isCreateNew: widget.isCreateNew),
      child: BlocConsumer<PreviewResumeCubit, PreviewResumeState>(
        listener: (context, state) {
          _nameController.text = state.userResumeEntity?.title ?? '';
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).maybePop();
                    },
                    child: Text(
                      context.language.cancel,
                      style: TextStyleUtils.normal(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: BaseTextField(
                        controller: _nameController,
                        isCollapsed: true,
                        fillColor: context.theme.backgroundColor,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        textAlign: TextAlign.center,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: context.theme.borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: context.theme.borderColor),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.read<PreviewResumeCubit>().saveUserResume(
                        userResumeEntity: state.userResumeEntity!.copyWith(title: _nameController.text),
                      );
                    },
                    child: Text(context.language.save, style: TextStyleUtils.normal(color: Colors.white, fontSize: 14)),
                  ),
                ],
              ),
              backgroundColor: context.theme.primaryColor,
            ),
            body: Container(
              padding: const EdgeInsets.all(16),
              color: context.theme.backgroundColor,
              child: Column(
                children: [
                  _headerRow(),
                  Expanded(child: _body()),
                  _footerRow(state.userResumeEntity),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _headerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("", style: TextStyleUtils.bold(color: context.theme.textColor, fontSize: 18)),
        Text(
          context.language.changeTemplate,
          style: TextStyleUtils.bold(color: context.theme.primaryColor, fontSize: 16),
        ),
      ],
    );
  }

  Widget _body() {
    return Container();
  }

  Widget _footerRow(UserResumeEntity? userResumeEntity) {
    return Builder(
      builder: (context) {
        return Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(color: context.theme.primaryColor, borderRadius: BorderRadius.circular(4)),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.paintbrush, size: 16, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(context.language.theme, style: TextStyleUtils.bold(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: InkWell(
                onTap: () async {
                  if (userResumeEntity == null) return;
                  final result = await AutoRouter.of(context).push(LayoutResumeRoute(userResumeEntity: userResumeEntity));

                  if (!context.mounted) return;

                  if (result is UserResumeEntity) {
                    context.read<PreviewResumeCubit>().saveUserResume(userResumeEntity: result);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(color: context.theme.primaryColor, borderRadius: BorderRadius.circular(4)),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.pencil, size: 16, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(context.language.content, style: TextStyleUtils.bold(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
