import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class OtherInformationScreen extends StatefulWidget {
  const OtherInformationScreen({super.key});

  @override
  State<OtherInformationScreen> createState() => _OtherInformationScreenState();
}

class _OtherInformationScreenState extends State<OtherInformationScreen> {
  final TextEditingController _otherInfoController = TextEditingController();

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
          context.language.otherInformation,
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
                  controller: _otherInfoController,
                  isRequired: true,
                  title: context.language.information,
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

