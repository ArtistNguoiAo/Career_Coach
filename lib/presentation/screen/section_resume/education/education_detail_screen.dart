import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_content.dart';
import 'package:career_coach/presentation/core/widgets/base_content_date.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

@RoutePage()
class EducationDetailScreen extends StatefulWidget {
  const EducationDetailScreen({super.key});

  @override
  State<EducationDetailScreen> createState() => _EducationDetailScreenState();
}

class _EducationDetailScreenState extends State<EducationDetailScreen> {
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _majorController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            AutoRouter.of(context).maybePop();
          },
          child: Icon(
            FontAwesomeIcons.chevronLeft,
            color: context.theme.backgroundColor,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: Text(
          context.language.education,
          style: TextStyleUtils.bold(
            color: context.theme.backgroundColor,
            fontSize: 18,
          ),
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
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseContent(
                  controller: _schoolController,
                  isRequired: true,
                  title: context.language.nameSchool,
                ),
                SizedBox(height: 8.0),
                BaseContent(
                  controller: _majorController,
                  isRequired: true,
                  title: context.language.major,
                ),
                SizedBox(height: 8.0),
                BaseContent(
                  controller: _degreeController,
                  isRequired: false,
                  title: context.language.degree,
                ),
                SizedBox(height: 8.0),
                BaseContentDate(
                  controller: _startDateController,
                  isRequired: false,
                  title: context.language.startDate,
                  onTap: () async {
                    DateTime? currentStartDate;
                    DateTime? currentEndDate;

                    if (_startDateController.text.isNotEmpty) {
                      currentStartDate = DateFormat('yyyy-MM-dd').parse(_startDateController.text);
                    }
                    if (_endDateController.text.isNotEmpty) {
                      currentEndDate = DateFormat('yyyy-MM-dd').parse(_endDateController.text);
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
                      _startDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                    }
                  },
                ),
                SizedBox(height: 8.0),
                BaseContentDate(
                  controller: _endDateController,
                  isRequired: false,
                  title: context.language.endDate,
                  onTap: () async {
                    DateTime? currentStartDate;
                    DateTime? currentEndDate;

                    if (_startDateController.text.isNotEmpty) {
                      currentStartDate = DateFormat('yyyy-MM-dd').parse(_startDateController.text);
                    }
                    if (_endDateController.text.isNotEmpty) {
                      currentEndDate = DateFormat('yyyy-MM-dd').parse(_endDateController.text);
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
                      _endDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                    }
                  },
                ),
                SizedBox(height: 8.0),
                BaseContent(
                  controller: _descriptionController,
                  isRequired: false,
                  title: context.language.description,
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.theme.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Text(
            context.language.save,
            style: TextStyleUtils.bold(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
