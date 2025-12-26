import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BaseLoading extends StatelessWidget {
  const BaseLoading({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: LoadingAnimationWidget.fourRotatingDots(
          color: context.theme.primaryColor,
          size: size ?? 40,
        ),
      ),
    );
  }
}