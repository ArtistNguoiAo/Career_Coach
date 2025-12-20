import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/education_entity.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_content.dart';
import 'package:career_coach/presentation/core/widgets/base_content_date.dart';
import 'package:career_coach/presentation/core/widgets/base_content_quill.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_delta_from_html/flutter_quill_delta_from_html.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';
import 'package:career_coach/presentation/screen/section_resume/education/cubit/education_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

@RoutePage()
class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key, required this.userResumeId});

  final int userResumeId;

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final List<TextEditingController> _listSchoolController = [];
  final List<TextEditingController> _listMajorController = [];
  final List<TextEditingController> _listDegreeController = [];
  final List<TextEditingController> _listStartTimeController = [];
  final List<TextEditingController> _listEndTimeController = [];
  final List<QuillController> _listDescriptionController = [];
  final List<FocusNode> _listDescriptionFocusNode = [];
  final List<ScrollController> _listDescriptionScrollController = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EducationCubit()..init(userResumeId: widget.userResumeId),
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
            context.language.education,
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
    return BlocConsumer<EducationCubit, EducationState>(
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

        _listSchoolController.clear();
        _listMajorController.clear();
        _listDegreeController.clear();
        _listStartTimeController.clear();
        _listEndTimeController.clear();
        _listDescriptionController.clear();
        _listDescriptionFocusNode.clear();
        _listDescriptionScrollController.clear();
        for (var it in state.listEducation) {
          _listSchoolController.add(TextEditingController(text: it.school));
          _listMajorController.add(TextEditingController(text: it.major));
          _listDegreeController.add(TextEditingController(text: it.degree));
          _listStartTimeController.add(TextEditingController(text: it.startTime));
          _listEndTimeController.add(TextEditingController(text: it.endTime));
          
          final String description = it.description;
          final Document document = description.trim().isEmpty
              ? Document()
              : Document.fromDelta(HtmlToDelta().convert(description));

          _listDescriptionController.add(
            QuillController(document: document, selection: const TextSelection.collapsed(offset: 0)),
          );
          _listDescriptionFocusNode.add(FocusNode());
          _listDescriptionScrollController.add(ScrollController());
        }
      },
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.listEducation.length,
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
                      if (state.listEducation[index].displayOrder != state.listEducation.length - 1) ...[
                        _buttonChange(type: 1, onChange: () {
                          saveTemp(state.listEducation);
                          context.read<EducationCubit>().changeEducation(index, index + 1);
                        }),
                        SizedBox(width: 16),
                      ],
                      if (state.listEducation[index].displayOrder != 0) ...[
                        _buttonChange(type: 2, onChange: () {
                          saveTemp(state.listEducation);
                          context.read<EducationCubit>().changeEducation(index, index - 1);
                        }),
                        SizedBox(width: 16),
                      ],
                      _buttonChange(type: 0, onChange: () {
                        saveTemp(state.listEducation);
                        context.read<EducationCubit>().deleteEducation(index);
                      }),
                    ],
                  ),
                  BaseContent(
                    controller: _listSchoolController[index],
                    isRequired: true,
                    title: context.language.nameSchool,
                  ),
                  SizedBox(height: 8.0),
                  BaseContent(
                    controller: _listMajorController[index],
                    isRequired: true,
                    title: context.language.major,
                  ),
                  SizedBox(height: 8.0),
                  BaseContent(
                    controller: _listDegreeController[index],
                    isRequired: false,
                    title: context.language.degree,
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
                  BaseContentQuill(
                    controller: _listDescriptionController[index],
                    focusNode: _listDescriptionFocusNode[index],
                    scrollController: _listDescriptionScrollController[index],
                    isRequired: false,
                    title: context.language.description,
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
    return BlocBuilder<EducationCubit, EducationState>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    saveTemp(state.listEducation);
                    context.read<EducationCubit>().addEducation();
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
                    saveTemp(state.listEducation);
                    context.read<EducationCubit>().save(userResumeId: widget.userResumeId);
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

  void saveTemp(List<EducationEntity> listEducation) {
    for (var it in listEducation) {
      final index = listEducation.indexOf(it);
      it.school = _listSchoolController[index].text;
      it.major = _listMajorController[index].text;
      it.degree = _listDegreeController[index].text;
      it.startTime = _listStartTimeController[index].text;
      it.endTime = _listEndTimeController[index].text;
      it.description = QuillDeltaToHtmlConverter(
        _listDescriptionController[index].document.toDelta().toJson(),
        ConverterOptions(),
      ).convert();
    }
  }
}
