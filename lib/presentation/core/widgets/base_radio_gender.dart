import 'package:career_coach/domain/enum/type_gender_enum.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/string_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';

class BaseRadioGender extends StatefulWidget {
  const BaseRadioGender({
    super.key,
    required this.controller,
    required this.isRequired,
    required this.title,
  });

  final TextEditingController controller;
  final bool isRequired;
  final String title;

  @override
  State<BaseRadioGender> createState() => _BaseRadioGenderState();
}

class _BaseRadioGenderState extends State<BaseRadioGender> {
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
        Wrap(
          children: TypeGenderEnum.values.map((option) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<TypeGenderEnum>(
                  value: option,
                  groupValue: TypeGenderEnum.values.firstWhere(
                    (e) => e.name == widget.controller.text,
                    orElse: () => TypeGenderEnum.OTHER,
                  ),
                  onChanged: (TypeGenderEnum? value) {
                    setState(() {
                      widget.controller.text = value?.name ?? '';
                    });
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: context.theme.primaryColor,
                ),
                Text(
                  StringUtils.convertTypeGenderEnum(context, option),
                  style: TextStyleUtils.normal(
                    color: context.theme.textColor,
                  ),
                ),
              ],
            );
          }).toList(),
        )
      ],
    );
  }
}
