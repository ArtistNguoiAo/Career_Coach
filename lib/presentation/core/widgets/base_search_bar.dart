import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BaseSearchBar extends StatefulWidget {
  const BaseSearchBar({
    super.key,
    required this.controller,
    this.border,
    this.focusedBorder,
    this.errorBorder,
    this.enabledBorder,
    this.disabledBorder,
  });

  final TextEditingController controller;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;

  @override
  State<BaseSearchBar> createState() => _BaseSearchBarState();
}

class _BaseSearchBarState extends State<BaseSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        border: widget.border ?? OutlineInputBorder(borderRadius: BorderRadius.circular(100), borderSide: BorderSide(color: context.theme.borderColor)),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(borderRadius: BorderRadius.circular(100), borderSide: BorderSide(color: context.theme.primaryColor)),
        errorBorder: widget.errorBorder ?? OutlineInputBorder(borderRadius: BorderRadius.circular(100), borderSide: BorderSide(color: context.theme.borderColor)),
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(borderRadius: BorderRadius.circular(100), borderSide: BorderSide(color: context.theme.borderColor)),
        disabledBorder: widget.disabledBorder ??
            OutlineInputBorder(borderRadius: BorderRadius.circular(100), borderSide: BorderSide(color: context.theme.borderColor)),
        prefixIcon: Icon(
          IconlyLight.search,
          color: context.theme.borderColor,
        ),
        hintText: context.language.search,
        hintStyle: TextStyleUtils.normal(
          color: context.theme.borderColor,
        ),
      ),
    );
  }
}
