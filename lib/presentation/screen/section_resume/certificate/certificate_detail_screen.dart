import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_content.dart';
import 'package:career_coach/presentation/core/widgets/base_content_date.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

@RoutePage()
class CertificateDetailScreen extends StatefulWidget {
  const CertificateDetailScreen({super.key});

  @override
  State<CertificateDetailScreen> createState() => _CertificateDetailScreenState();
}

class _CertificateDetailScreenState extends State<CertificateDetailScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

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
          context.language.certificate,
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
                  controller: _nameController,
                  isRequired: true,
                  title: context.language.nameCertificate,
                ),
                SizedBox(height: 8.0),
                BaseContentDate(
                  controller: _dateController,
                  isRequired: false,
                  title: context.language.time,
                  onTap: () async {
                    DateTime? currentDate;
                    if( _dateController.text.isNotEmpty) {
                      currentDate = DateFormat('dd/MM/yyyy').parse(_dateController.text);
                    }

                    final now = DateTime.now();

                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate ?? now,
                      firstDate: DateTime(1900),
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
                      _dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
                    }
                  },
                ),
                SizedBox(height: 8.0),
                BaseContent(
                  controller: _linkController,
                  isRequired: false,
                  title: context.language.link,
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
