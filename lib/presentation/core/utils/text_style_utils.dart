import 'package:career_coach/presentation/core/utils/font_utils.dart';
import 'package:flutter/material.dart';

class TextStyleUtils {
  TextStyleUtils._();

  static TextStyle normal({
    double fontSize = 16,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w400,
      decoration: decoration,
      fontFamily: FontUtils.nunito,
    );
  }

  static TextStyle bold({
    double fontSize = 16,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w700,
      decoration: decoration,
      fontFamily: FontUtils.nunito,
    );
  }
}