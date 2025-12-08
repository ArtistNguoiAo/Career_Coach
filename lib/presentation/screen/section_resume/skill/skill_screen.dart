import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_content.dart';
import 'package:career_coach/presentation/screen/section_resume/skill/cubit/skill_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class SkillScreen extends StatefulWidget {
  const SkillScreen({super.key, required this.userResumeId});

  final int userResumeId;

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  final List<TextEditingController> _listNameController = [];
  final List<TextEditingController> _listDescriptionController = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SkillCubit()..init(userResumeId: widget.userResumeId),
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
            context.language.skill,
            style: TextStyleUtils.bold(color: context.theme.backgroundColor, fontSize: 18),
          ),
          backgroundColor: context.theme.primaryColor,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          color: context.theme.backgroundColor,
          child: Column(
            children: [
              Expanded(child: _listView()),
              SizedBox(height: 16.0),
              _buttonSave(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listView() {
    return BlocConsumer<SkillCubit, SkillState>(
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
        }

        _listNameController.clear();
        _listDescriptionController.clear();
        for (var it in state.listSkill) {
          _listNameController.add(TextEditingController(text: it.name));
          _listDescriptionController.add(TextEditingController(text: it.description));
        }
      },
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.listSkill.length,
          separatorBuilder: (context, index) => SizedBox(height: 16),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: context.theme.lightGreyColor, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Container()),
                      if (state.listSkill[index].displayOrder != state.listSkill.length - 1) ...[
                        _buttonChange(type: 1, onChange: () {
                          state.listSkill[index].name = _listNameController[index].text;
                          state.listSkill[index].description = _listDescriptionController[index].text;
                          context.read<SkillCubit>().changeSkill(index, index + 1);
                        }),
                        SizedBox(width: 16),
                      ],
                      if (state.listSkill[index].displayOrder != 0) ...[
                        _buttonChange(type: 2, onChange: () {
                          state.listSkill[index].name = _listNameController[index].text;
                          state.listSkill[index].description = _listDescriptionController[index].text;
                          context.read<SkillCubit>().changeSkill(index, index - 1);
                        }),
                        SizedBox(width: 16),
                      ],
                      _buttonChange(type: 0, onChange: () {
                        context.read<SkillCubit>().deleteSkill(index);
                      }),
                    ],
                  ),
                  BaseContent(
                    controller: _listNameController[index],
                    isRequired: true,
                    title: context.language.nameSkill,
                  ),
                  SizedBox(height: 8.0),
                  BaseContent(
                    controller: _listDescriptionController[index],
                    isRequired: false,
                    title: context.language.description,
                    maxLines: 5,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buttonChange({required int type, Function()? onChange}) {
    return InkWell(
      onTap: onChange,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: type == 0 ? Colors.redAccent : context.theme.primaryColor, width: 1),
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(
          type == 0
              ? FontAwesomeIcons.trashCan
              : type == 1
              ? FontAwesomeIcons.angleDown
              : FontAwesomeIcons.angleUp,
          color: type == 0 ? Colors.redAccent : context.theme.primaryColor,
          size: 18,
        ),
      ),
    );
  }

  Widget _buttonSave() {
    return BlocBuilder<SkillCubit, SkillState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  context.read<SkillCubit>().addSkill();
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor.withAlpha((255 * 0.1).round()),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    context.language.add,
                    style: TextStyleUtils.bold(color: context.theme.primaryColor, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: InkWell(
                onTap: () {
                  for (var it in state.listSkill) {
                    final index = state.listSkill.indexOf(it);
                    it.name = _listNameController[index].text;
                    it.description = _listDescriptionController[index].text;
                  }
                  context.read<SkillCubit>().save(userResumeId: widget.userResumeId);
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
            ),
          ],
        );
      }
    );
  }
}
