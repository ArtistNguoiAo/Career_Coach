import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BaseContentDate extends StatefulWidget {
  const BaseContentDate({
    super.key,
    required this.controller,
    required this.isRequired,
    required this.title,
    this.maxLines,
    this.onTap,
  });

  final TextEditingController controller;
  final bool isRequired;
  final String title;
  final int? maxLines;
  final Future<void>? Function()? onTap;

  @override
  State<BaseContentDate> createState() => _BaseContentDateState();
}

class _BaseContentDateState extends State<BaseContentDate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: widget.title,
            style: TextStyleUtils.bold(
              color: context.theme.textColor,
            ),
            children: [
              if (widget.isRequired)
                TextSpan(
                    text: ' *',
                    style: TextStyleUtils.bold(
                      color: context.theme.badColor,
                    )
                ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: widget.controller,
                style: TextStyleUtils.normal(
                  color: context.theme.textColor,
                ),
                textInputAction: TextInputAction.done,
                maxLines: widget.maxLines,
                readOnly: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  filled: true,
                  fillColor: context.theme.backgroundColor,
                  isDense: true,
                  isCollapsed: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: context.theme.borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: context.theme.borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: context.theme.borderColor),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: widget.onTap,
              child: Container(
                height: 32,
                width: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.theme.primaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  FontAwesomeIcons.calendarDay,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
