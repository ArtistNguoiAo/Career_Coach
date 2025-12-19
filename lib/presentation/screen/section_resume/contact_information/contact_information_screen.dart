import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_content.dart';
import 'package:career_coach/presentation/core/widgets/base_content_date.dart';
import 'package:career_coach/presentation/screen/section_resume/contact_information/cubit/contact_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ContactInformationScreen extends StatefulWidget {
  const ContactInformationScreen({super.key, required this.userResumeId});

  final int userResumeId;

  @override
  State<ContactInformationScreen> createState() => _ContactInformationScreenState();
}

class _ContactInformationScreenState extends State<ContactInformationScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _portfolioController = TextEditingController();
  final TextEditingController _facebookController = TextEditingController();
  final TextEditingController _linkedinController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactInformationCubit()..init(userResumeId: widget.userResumeId),
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
            context.language.contactInformation,
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
    return BlocConsumer<ContactInformationCubit, ContactInformationState>(
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
                style: TextStyleUtils.normal(
                  color: context.theme.backgroundColor,
                  fontSize: 12,
                ),
              ),
              backgroundColor: context.theme.goodColor,
              duration: const Duration(seconds: 1),
            ),
          );
        }
        if(state.error.isNotEmpty) {
          DialogUtils.showErrorDialog(context: context, message: state.error);
          state.error = '';
        }

        _fullNameController.text = state.contactInformationEntity?.fullName ?? '';
        _positionController.text = state.contactInformationEntity?.position ?? '';
        _emailController.text = state.contactInformationEntity?.email ?? '';
        _phoneController.text = state.contactInformationEntity?.phoneNumber ?? '';
        _addressController.text = state.contactInformationEntity?.address ?? '';
        _dateOfBirthController.text = state.contactInformationEntity?.dateOfBirth ?? '';
        _portfolioController.text = state.contactInformationEntity?.portfolio ?? '';
        _facebookController.text = state.contactInformationEntity?.facebook ?? '';
        _linkedinController.text = state.contactInformationEntity?.linkedIn ?? '';
        _githubController.text = state.contactInformationEntity?.github ?? '';
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
                    BaseContent(controller: _emailController, isRequired: false, title: context.language.email),
                    SizedBox(height: 8.0),
                    BaseContent(controller: _phoneController, isRequired: false, title: context.language.phone),
                    SizedBox(height: 8.0),
                    BaseContent(
                      controller: _addressController,
                      isRequired: false,
                      title: context.language.address,
                    ),
                    SizedBox(height: 8.0),
                    BaseContentDate(
                      controller: _dateOfBirthController,
                      isRequired: false,
                      title: context.language.dateOfBirth,
                      onTap: () async {
                        DateTime? currentDate;
                        if (_dateOfBirthController.text.isNotEmpty) {
                          currentDate = DateFormat('yyyy-MM-dd').parse(_dateOfBirthController.text);
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
                          _dateOfBirthController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
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
                    BaseContent(controller: _githubController, isRequired: false, title: context.language.github),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                state.contactInformationEntity?.fullName = _fullNameController.text;
                state.contactInformationEntity?.position = _positionController.text;
                state.contactInformationEntity?.email = _emailController.text;
                state.contactInformationEntity?.phoneNumber = _phoneController.text;
                state.contactInformationEntity?.address = _addressController.text;
                state.contactInformationEntity?.dateOfBirth = _dateOfBirthController.text;
                state.contactInformationEntity?.portfolio = _portfolioController.text;
                state.contactInformationEntity?.facebook = _facebookController.text;
                state.contactInformationEntity?.linkedIn = _linkedinController.text;
                state.contactInformationEntity?.github = _githubController.text;
                context.read<ContactInformationCubit>().save();
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: context.theme.primaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
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
