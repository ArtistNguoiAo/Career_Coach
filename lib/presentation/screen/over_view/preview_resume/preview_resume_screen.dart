import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/resume_entity.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class PreviewResumeScreen extends StatefulWidget {
  const PreviewResumeScreen({super.key, required this.resumeEntity});

  final ResumeEntity resumeEntity;

  @override
  State<PreviewResumeScreen> createState() => _PreviewResumeScreenState();
}

class _PreviewResumeScreenState extends State<PreviewResumeScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.language.cancel,
              style: TextStyleUtils.normal(color: Colors.white, fontSize: 14),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: BaseTextField(
                  controller: controller,
                  isCollapsed: true,
                  fillColor: context.theme.backgroundColor,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  textAlign: TextAlign.center,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: context.theme.borderColor)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: context.theme.borderColor)
                  ),
                ),
              ),
            ),
            Text(
              context.language.save,
              style: TextStyleUtils.normal(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
        backgroundColor: context.theme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _headerRow(),
            Expanded(child: _body()),
            _footerRow(),
          ],
        ),
      ),
    );
  }

  Widget _headerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.resumeEntity.title,
          style: TextStyleUtils.bold(
            color: context.theme.textColor,
            fontSize: 18,
          ),
        ),
        Text(
          context.language.changeTemplate,
          style: TextStyleUtils.bold(
            color: context.theme.primaryColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return Image.network(
      widget.resumeEntity.thumbnailUrl,
      fit: BoxFit.contain,
      width: double.infinity,
    );
  }

  Widget _footerRow() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: context.theme.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.paintbrush,
                  size: 20,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  context.language.editTheme,
                  style: TextStyleUtils.bold(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: context.theme.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.pencil,
                  size: 20,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  context.language.editContent,
                  style: TextStyleUtils.bold(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
