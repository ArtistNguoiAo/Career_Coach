import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

class BaseMarkdown extends StatefulWidget {
  const BaseMarkdown({super.key, required this.data});

  final String data;

  @override
  State<BaseMarkdown> createState() => _BaseMarkdownState();
}

class _BaseMarkdownState extends State<BaseMarkdown> {
  @override
  Widget build(BuildContext context) {
    return  Markdown(
      padding: EdgeInsets.zero,
      data: widget.data,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      styleSheet: MarkdownStyleSheet(
        p: TextStyleUtils.normal(
          color: context.theme.primaryDarkColor,
        ),
        strong: TextStyleUtils.bold(
          color: context.theme.primaryDarkColor,
        ),
        em: TextStyleUtils.normal(
          color: context.theme.primaryDarkColor,
        ),
        a: TextStyle(
          color: context.theme.primaryColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
