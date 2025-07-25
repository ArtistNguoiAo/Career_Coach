import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DialogUtils {
  static bool _isShowing = false;

  static void showLoadingDialog(BuildContext context) {
    if (_isShowing) return;
    _isShowing = true;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 8.0,
            contentPadding: const EdgeInsets.all(16.0),
            content: SizedBox(
              width: 150.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LoadingAnimationWidget.fourRotatingDots(
                    color: context.theme.primaryColor,
                    size: 40,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${context.language.loading}...',
                    style: TextStyleUtils.bold(
                      fontSize: 16,
                      color: context.theme.textColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static void hideLoadingDialog(BuildContext context) {
    if (_isShowing) {
      Navigator.of(context).pop();
      _isShowing = false;
    }
  }

  static void showErrorDialog({required BuildContext context, required String message}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                IconlyBold.danger,
                size: 22,
                color: context.theme.badColor,
              ),
              const SizedBox(height: 10),
              Text(
                message,
                style: TextStyleUtils.normal(
                  fontSize: 16,
                  color: context.theme.textColor,
                ),
              ),
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                AutoRouter.of(context).maybePop();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: context.theme.primaryColor),
                  color: context.theme.primaryColor,
                ),
                child: Text(
                  'OK',
                  style: TextStyleUtils.normal(
                    fontSize: 16,
                    color: context.theme.backgroundColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}