import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_content.dart';
import 'package:career_coach/presentation/core/widgets/base_content_date.dart';
import 'package:career_coach/presentation/core/widgets/base_radio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    );
  }
}
