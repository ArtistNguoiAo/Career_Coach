import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/media_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

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
                Lottie.asset(MediaUtils.ltLoading, width: 80, fit: BoxFit.cover),
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
      },
    );
  }

  static void hideLoadingDialog(BuildContext context) {
    if (_isShowing) {
      Navigator.of(context).pop();
      _isShowing = false;
    }
  }

  static void showErrorDialog({
    required BuildContext context,
    required String message,
    Function? onClose,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(IconlyBold.danger, size: 22, color: context.theme.badColor),
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
                if (onClose != null) {
                  onClose();
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 4,
                ),
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

  static void showChooseImageDialog({
    required BuildContext context,
    required Function(File?) onClose,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  context.language.chooseImage,
                  style: TextStyleUtils.bold(
                    fontSize: 18,
                    color: context.theme.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: () {
                  AutoRouter.of(context).maybePop();
                },
                child: Icon(
                  FontAwesomeIcons.circleXmark,
                  size: 24,
                  color: context.theme.iconFeatureColor,
                ),
              ),
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                AutoRouter.of(context).maybePop(true);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: context.theme.primaryColor),
                  color: context.theme.primaryColor,
                ),
                child: Text(
                  context.language.fromCamera,
                  style: TextStyleUtils.normal(
                    fontSize: 16,
                    color: context.theme.backgroundColor,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                AutoRouter.of(context).maybePop(false);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: context.theme.primaryColor),
                  color: context.theme.primaryColor,
                ),
                child: Text(
                  context.language.fromGallery,
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
    ).then((value) async {
      if (value != null && value is bool) {
        final ImagePicker picker = ImagePicker();
        final XFile? image;
        if (value) {
          image = await picker.pickImage(source: ImageSource.camera);
        } else {
          image = await picker.pickImage(source: ImageSource.gallery);
        }
        if (image != null) {
          final File file = File(image.path);
          onClose(file);
        } else {
          onClose(null);
        }
      }
    });
  }

  static void showWarningChangeDialog({
    required BuildContext context,
    required Function(bool) onClose,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: context.theme.backgroundColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      context.language.cancelChange,
                      style: TextStyleUtils.bold(
                        fontSize: 18,
                        color: context.theme.textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).maybePop();
                    },
                    child: Icon(
                      FontAwesomeIcons.circleXmark,
                      size: 24,
                      color: context.theme.iconFeatureColor,
                    ),
                  ),
                ],
              ),
              Text(
                context.language.contentCancelChange,
                style: TextStyleUtils.normal(
                  fontSize: 16,
                  color: context.theme.textColor,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        AutoRouter.of(context).maybePop(false);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: context.theme.lightGreyColor,
                        ),
                        child: Text(
                          context.language.continueChange,
                          style: TextStyleUtils.bold(
                            fontSize: 16,
                            color: context.theme.textColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        AutoRouter.of(context).maybePop(true);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: context.theme.badColor.withAlpha(
                            (255 * 0.1).round(),
                          ),
                        ),
                        child: Text(
                          context.language.cancelChange2,
                          style: TextStyleUtils.bold(
                            fontSize: 16,
                            color: context.theme.badColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ).then((value) async {
      onClose(value);
    });
  }

  static void showDeleteAccountDialog({
    required BuildContext context,
    required Function onDelete,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: context.theme.backgroundColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(IconlyBold.danger, size: 22, color: context.theme.badColor),
              const SizedBox(height: 10),
              Text(
                context.language.deleteAccountContent,
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
                AutoRouter.of(context).maybePop(true);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.theme.badColor.withAlpha((255 * 0.1).round()),
                ),
                child: Text(
                  context.language.delete,
                  style: TextStyleUtils.normal(
                    fontSize: 16,
                    color: context.theme.badColor,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                AutoRouter.of(context).maybePop(false);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.theme.lightGreyColor,
                ),
                child: Text(
                  context.language.cancel,
                  style: TextStyleUtils.normal(
                    fontSize: 16,
                    color: context.theme.textColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ).then((value) async {
      if(value != null && value is bool && value) {
        await onDelete(value);
      }
    });
  }
}
