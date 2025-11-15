import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';

class BaseTextField extends StatefulWidget {
  const BaseTextField({
    super.key,
    required this.controller,
    this.border,
    this.focusedBorder,
    this.errorBorder,
    this.enabledBorder,
    this.disabledBorder,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.labelStyle,
    this.style,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.fillColor,
    this.onChanged,
    this.readOnly,
    this.isCollapsed,
    this.contentPadding,
    this.textAlign,
  });

  final TextEditingController controller;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final Function(String)? onChanged;
  final bool? readOnly;
  final bool? isCollapsed;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? textAlign;

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      readOnly: widget.readOnly ?? false,
      textAlign: widget.textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        isDense: true,
        isCollapsed: widget.isCollapsed,
        contentPadding: widget.contentPadding,
        filled: widget.fillColor != null,
        fillColor: widget.fillColor,
        border: widget.border ?? OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: context.theme.borderColor)),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: context.theme.primaryColor)),
        errorBorder:
        widget.errorBorder ?? OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: context.theme.borderColor)),
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: context.theme.borderColor)),
        disabledBorder: widget.disabledBorder ??
            OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: context.theme.borderColor)),
        hintText: widget.hintText,
        hintStyle: widget.labelStyle ?? TextStyleUtils.normal(
          color: context.theme.borderColor,
        ),
        labelText: widget.labelText,
        labelStyle: widget.hintStyle ?? TextStyleUtils.normal(
          color: context.theme.borderColor,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
      ),
      style: widget.style ?? TextStyleUtils.normal(),
      obscureText: widget.obscureText ?? false,
      onChanged: widget.onChanged,
    );
  }
}