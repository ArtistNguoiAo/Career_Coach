import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_content_quill.dart';
import 'package:career_coach/presentation/screen/section_resume/goal/cubit/goal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_delta_from_html/flutter_quill_delta_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

@RoutePage()
class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key, required this.userResumeId});

  final int userResumeId;

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  final QuillController _goalController = QuillController(
    document: Document(),
    selection: const TextSelection.collapsed(offset: 0),
  );
  final FocusNode _goalFocusNode = FocusNode();
  final ScrollController _goalScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoalCubit()..init(userResumeId: widget.userResumeId),
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
            context.language.goal,
            style: TextStyleUtils.bold(color: context.theme.backgroundColor, fontSize: 18),
          ),
          backgroundColor: context.theme.primaryColor,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          color: context.theme.backgroundColor,
          child: _body(),
        ),
      ),
    );
  }

  Widget _body() {
    return BlocConsumer<GoalCubit, GoalState>(
      listener: (context, state) {
        if (state.isLoading) {
          DialogUtils.showLoadingDialog(context);
        } else {
          DialogUtils.hideLoadingDialog(context);
        }
        if (state.isSavedSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                context.language.saveInformationSuccess,
                style: TextStyleUtils.normal(color: context.theme.backgroundColor, fontSize: 12),
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

        _goalController.document = Document.fromDelta(HtmlToDelta().convert(state.goalEntity!.content));
        _goalFocusNode.unfocus();
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: BaseContentQuill(
                controller: _goalController,
                focusNode: _goalFocusNode,
                scrollController: _goalScrollController,
                isRequired: true,
                title: context.language.careerGoal,
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                _goalFocusNode.unfocus();
                FocusManager.instance.primaryFocus?.unfocus();

                final content = QuillDeltaToHtmlConverter(
                  _goalController.document.toDelta().toJson(),
                  ConverterOptions(),
                ).convert();

                state.goalEntity?.content = content;
                context.read<GoalCubit>().save();
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: context.theme.primaryColor, borderRadius: BorderRadius.circular(4)),
                child: Text(
                  context.language.save,
                  textAlign: TextAlign.center,
                  style: TextStyleUtils.bold(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
