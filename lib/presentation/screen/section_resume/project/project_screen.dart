import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/project_entity.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_content.dart';
import 'package:career_coach/presentation/core/widgets/base_content_date.dart';
import 'package:career_coach/presentation/screen/section_resume/project/cubit/project_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key, required this.userResumeId});

  final int userResumeId;

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final List<TextEditingController> _listNameController = [];
  final List<TextEditingController> _listPositionController = [];
  final List<TextEditingController> _listStartTimeController = [];
  final List<TextEditingController> _listEndTimeController = [];
  final List<TextEditingController> _listDescriptionController = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProjectCubit()..init(userResumeId: widget.userResumeId),
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
            context.language.project,
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
    return BlocConsumer<ProjectCubit, ProjectState>(
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
        _listPositionController.clear();
        _listStartTimeController.clear();
        _listEndTimeController.clear();
        _listDescriptionController.clear();
        for (var it in state.listProject) {
          _listNameController.add(TextEditingController(text: it.name));
          _listPositionController.add(TextEditingController(text: it.position));
          _listStartTimeController.add(TextEditingController(text: it.startTime));
          _listEndTimeController.add(TextEditingController(text: it.endTime));
          _listDescriptionController.add(TextEditingController(text: it.description));
        }
      },
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.listProject.length,
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
                      if (state.listProject[index].displayOrder != state.listProject.length - 1) ...[
                        _buttonChange(type: 1, onChange: () {
                          saveTemp(state.listProject);
                          context.read<ProjectCubit>().changeProject(index, index + 1);
                        }),
                        SizedBox(width: 16),
                      ],
                      if (state.listProject[index].displayOrder != 0) ...[
                        _buttonChange(type: 2, onChange: () {
                          saveTemp(state.listProject);
                          context.read<ProjectCubit>().changeProject(index, index - 1);
                        }),
                        SizedBox(width: 16),
                      ],
                      _buttonChange(type: 0, onChange: () {
                        saveTemp(state.listProject);
                        context.read<ProjectCubit>().deleteProject(index);
                      }),
                    ],
                  ),
                  BaseContent(
                    controller: _listNameController[index],
                    isRequired: true,
                    title: context.language.nameProject,
                  ),
                  SizedBox(height: 8.0),
                  BaseContent(
                    controller: _listPositionController[index],
                    isRequired: false,
                    title: context.language.position,
                  ),
                  SizedBox(height: 8.0),
                  BaseContentDate(
                    controller: _listStartTimeController[index],
                    isRequired: false,
                    title: context.language.startDate,
                    onTap: () async {
                      DateTime? currentStartDate;
                      DateTime? currentEndDate;

                      if (_listStartTimeController[index].text.isNotEmpty) {
                        currentStartDate = DateFormat('yyyy-MM-dd').parse(_listStartTimeController[index].text);
                      }
                      if (_listEndTimeController[index].text.isNotEmpty) {
                        currentEndDate = DateFormat('yyyy-MM-dd').parse(_listEndTimeController[index].text);
                      }

                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: currentStartDate ?? DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: currentEndDate ?? DateTime(2100, 12, 31),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: context.theme.primaryColor,
                                onPrimary: Colors.white,
                                onSurface: Colors.black,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (pickedDate != null) {
                        _listStartTimeController[index].text = DateFormat('yyyy-MM-dd').format(pickedDate);
                      }
                    },
                  ),
                  SizedBox(height: 8.0),
                  BaseContentDate(
                    controller: _listEndTimeController[index],
                    isRequired: false,
                    title: context.language.endDate,
                    onTap: () async {
                      DateTime? currentStartDate;
                      DateTime? currentEndDate;

                      if (_listStartTimeController[index].text.isNotEmpty) {
                        currentStartDate = DateFormat('yyyy-MM-dd').parse(_listStartTimeController[index].text);
                      }
                      if (_listEndTimeController[index].text.isNotEmpty) {
                        currentEndDate = DateFormat('yyyy-MM-dd').parse(_listEndTimeController[index].text);
                      }

                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: currentEndDate ?? DateTime.now(),
                        firstDate: currentStartDate ?? DateTime(1900),
                        lastDate: DateTime(2100, 12, 31),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: context.theme.primaryColor,
                                onPrimary: Colors.white,
                                onSurface: Colors.black,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (pickedDate != null) {
                        _listEndTimeController[index].text = DateFormat('yyyy-MM-dd').format(pickedDate);
                      }
                    },
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
    return BlocBuilder<ProjectCubit, ProjectState>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    saveTemp(state.listProject);
                    context.read<ProjectCubit>().addProject();
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
                    saveTemp(state.listProject);
                    context.read<ProjectCubit>().save(userResumeId: widget.userResumeId);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: context.theme.primaryColor, borderRadius: BorderRadius.circular(4)),
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

  void saveTemp(List<ProjectEntity> listProject) {
    for (var it in listProject) {
      final index = listProject.indexOf(it);
      it.name = _listNameController[index].text;
      it.position = _listPositionController[index].text;
      it.startTime = _listStartTimeController[index].text;
      it.endTime = _listEndTimeController[index].text;
      it.description = _listDescriptionController[index].text;
    }
  }
}
