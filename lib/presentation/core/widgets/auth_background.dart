import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/media_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: context.theme.backgroundColor,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: context.theme.primaryColor.withAlpha((255.0 * 0.1).round()),
          ),
          SvgPicture.asset(
            MediaUtils.imgAuthBackground,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              context.language.appName,
              style: TextStyleUtils.bold(
                fontSize: 48,
                color: context.theme.backgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
