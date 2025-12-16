import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_content.dart';
import 'package:career_coach/presentation/screen/section_resume/goal/cubit/goal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key, required this.userResumeId});

  final int userResumeId;

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  final TextEditingController _goalController = TextEditingController();

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

        _goalController.text = state.goalEntity?.content ?? '';
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseContent(
                      controller: _goalController,
                      isRequired: true,
                      title: context.language.careerGoal,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                state.goalEntity?.content = _goalController.text;
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
