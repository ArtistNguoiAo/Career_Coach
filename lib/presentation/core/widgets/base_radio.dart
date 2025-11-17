import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';

class BaseRadio extends StatefulWidget {
  const BaseRadio({
    super.key,
    required this.controller,
    required this.isRequired,
    required this.title,
  });

  final TextEditingController controller;
  final bool isRequired;
  final String title;

  @override
  State<BaseRadio> createState() => _BaseRadioState();
}

class _BaseRadioState extends State<BaseRadio> {
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
       
      ],
    );
  }
}
