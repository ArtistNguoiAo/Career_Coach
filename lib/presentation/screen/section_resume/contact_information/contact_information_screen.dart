import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_content.dart';
import 'package:career_coach/presentation/core/widgets/base_content_date.dart';
import 'package:career_coach/presentation/core/widgets/base_radio.dart';
import 'package:career_coach/presentation/screen/section_resume/contact_information/cubit/contact_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ContactInformationScreen extends StatefulWidget {
  const ContactInformationScreen({super.key});

  @override
  State<ContactInformationScreen> createState() =>
      _ContactInformationScreenState();
}

class _ContactInformationScreenState extends State<ContactInformationScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _portfolioController = TextEditingController();
  final TextEditingController _facebookController = TextEditingController();
  final TextEditingController _linkedinController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ContactInformationCubit()
        ..init(userResumeId: 88),
      child: Scaffold(
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
            context.language.contactInformation,
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
          child: BlocConsumer<ContactInformationCubit, ContactInformationState>(
            listener: (context, state) {
              // TODO: implement listener
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
                            controller: _fullNameController,
                            isRequired: true,
                            title: context.language.fullName,
                          ),
                          SizedBox(height: 8.0),
                          BaseContent(
                            controller: _positionController,
                            isRequired: false,
                            title: context.language.position,
                          ),
                          SizedBox(height: 8.0),
                          BaseContent(
                            controller: _emailController,
                            isRequired: true,
                            title: context.language.email,
                          ),
                          SizedBox(height: 8.0),
                          BaseContent(
                            controller: _phoneController,
                            isRequired: true,
                            title: context.language.phone,
                          ),
                          SizedBox(height: 8.0),
                          BaseContent(
                            controller: _addressController,
                            isRequired: true,
                            title: context.language.address,
                          ),
                          SizedBox(height: 8.0),
                          BaseRadio(
                            controller: _genderController,
                            isRequired: false,
                            title: context.language.gender,
                            value: [
                              context.language.male,
                              context.language.female,
                            ],
                          ),
                          BaseContentDate(
                            controller: _dateOfBirthController,
                            isRequired: false,
                            title: context.language.dateOfBirth,
                            onTap: () async {
                              DateTime? currentDate;
                              if (_dateOfBirthController.text.isNotEmpty) {
                                currentDate = DateFormat('dd/MM/yyyy').parse(_dateOfBirthController.text);
                              }

                              final now = DateTime.now();

                              final pickedDate = await showDatePicker(
                                context: context,
                                initialDate: currentDate ?? now,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(now.year, now.month, now.day),
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
                                _dateOfBirthController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
                              }
                            },
                          ),
                          SizedBox(height: 8.0),
                          BaseContent(
                            controller: _portfolioController,
                            isRequired: false,
                            title: context.language.portfolio,
                          ),
                          SizedBox(height: 8.0),
                          BaseContent(
                            controller: _facebookController,
                            isRequired: false,
                            title: context.language.facebook,
                          ),
                          SizedBox(height: 8.0),
                          BaseContent(
                            controller: _linkedinController,
                            isRequired: false,
                            title: context.language.linkedIn,
                          ),
                          SizedBox(height: 8.0),
                          BaseContent(
                            controller: _githubController,
                            isRequired: false,
                            title: context.language.github,
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
            },
          ),
        ),
      ),
    );
  }
}
