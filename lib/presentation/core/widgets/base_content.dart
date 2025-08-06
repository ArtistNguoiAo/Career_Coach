import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';

class BaseContent extends StatefulWidget {
  const BaseContent({
    super.key,
    required this.controller,
    required this.isRequired,
    required this.title,
    this.maxLines,
  });

  final TextEditingController controller;
  final bool isRequired;
  final String title;
  final int? maxLines;

  @override
  State<BaseContent> createState() => _BaseContentState();
}

class _BaseContentState extends State<BaseContent> {
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
        TextField(
          controller: widget.controller,
          style: TextStyleUtils.normal(
            color: context.theme.textColor,
          ),
          textInputAction: TextInputAction.done,
          maxLines: widget.maxLines,
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
              borderSide: BorderSide(color: context.theme.primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.theme.borderColor),
            ),
          ),
        )
      ],
    );
  }
}
