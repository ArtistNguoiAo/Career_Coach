import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/media_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  const TitleView({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(MediaUtils.imgTitleBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyleUtils.bold(
            fontSize: 18,
            color: context.theme.backgroundColor,
          ),
        ),
      ),
    );
  }
}
