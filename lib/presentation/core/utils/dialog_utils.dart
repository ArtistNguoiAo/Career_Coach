import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/resume_entity.dart';
import 'package:career_coach/domain/entity/user_resume_recent_entity.dart';
import 'package:career_coach/domain/enum/type_create_resume_enum.dart';
import 'package:career_coach/domain/enum/type_cv_source_enum.dart';
import 'package:career_coach/domain/enum/type_experience_level_enum.dart';
import 'package:career_coach/domain/enum/type_language_enum.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/media_utils.dart';
import 'package:career_coach/presentation/core/utils/string_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
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
                  style: TextStyleUtils.bold(fontSize: 16, color: context.theme.textColor),
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

  static void showErrorDialog({required BuildContext context, required String message, Function? onClose}) {
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
              Text(message, style: TextStyleUtils.normal(fontSize: 16, color: context.theme.textColor)),
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
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: context.theme.primaryColor),
                  color: context.theme.primaryColor,
                ),
                child: Text('OK', style: TextStyleUtils.normal(fontSize: 16, color: context.theme.backgroundColor)),
              ),
            ),
          ],
        );
      },
    );
  }

  static void showChooseImageDialog({required BuildContext context, required Function(File?) onClose}) {
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
                  style: TextStyleUtils.bold(fontSize: 18, color: context.theme.textColor),
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: () {
                  AutoRouter.of(context).maybePop();
                },
                child: Icon(FontAwesomeIcons.circleXmark, size: 24, color: context.theme.darkGreyColor),
              ),
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                AutoRouter.of(context).maybePop(true);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: context.theme.primaryColor),
                  color: context.theme.primaryColor,
                ),
                child: Text(
                  context.language.fromCamera,
                  style: TextStyleUtils.normal(fontSize: 16, color: context.theme.backgroundColor),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                AutoRouter.of(context).maybePop(false);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: context.theme.primaryColor),
                  color: context.theme.primaryColor,
                ),
                child: Text(
                  context.language.fromGallery,
                  style: TextStyleUtils.normal(fontSize: 16, color: context.theme.backgroundColor),
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

  static void showWarningChangeDialog({required BuildContext context, required Function(bool) onClose}) {
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
                      style: TextStyleUtils.bold(fontSize: 18, color: context.theme.textColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).maybePop();
                    },
                    child: Icon(FontAwesomeIcons.circleXmark, size: 24, color: context.theme.darkGreyColor),
                  ),
                ],
              ),
              Text(
                context.language.contentCancelChange,
                style: TextStyleUtils.normal(fontSize: 16, color: context.theme.textColor),
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
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: context.theme.lightGreyColor,
                        ),
                        child: Text(
                          context.language.continueChange,
                          style: TextStyleUtils.bold(fontSize: 16, color: context.theme.textColor),
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
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: context.theme.badColor.withAlpha((255 * 0.1).round()),
                        ),
                        child: Text(
                          context.language.cancelChange2,
                          style: TextStyleUtils.bold(fontSize: 16, color: context.theme.badColor),
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

  static void showDeleteAccountDialog({required BuildContext context, required Function onDelete}) {
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
                style: TextStyleUtils.normal(fontSize: 16, color: context.theme.textColor),
              ),
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                AutoRouter.of(context).maybePop(true);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.theme.badColor.withAlpha((255 * 0.1).round()),
                ),
                child: Text(
                  context.language.delete,
                  style: TextStyleUtils.normal(fontSize: 16, color: context.theme.badColor),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                AutoRouter.of(context).maybePop(false);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: context.theme.lightGreyColor),
                child: Text(
                  context.language.cancel,
                  style: TextStyleUtils.normal(fontSize: 16, color: context.theme.textColor),
                ),
              ),
            ),
          ],
        );
      },
    ).then((value) async {
      if (value != null && value is bool && value) {
        await onDelete(value);
      }
    });
  }

  static void showEndPreviewDialog({required BuildContext context, required Function onEnd}) {
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
                context.language.endInterviewContent,
                style: TextStyleUtils.normal(fontSize: 16, color: context.theme.textColor),
              ),
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                AutoRouter.of(context).maybePop(true);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.theme.badColor.withAlpha((255 * 0.1).round()),
                ),
                child: Text(
                  context.language.end,
                  style: TextStyleUtils.normal(fontSize: 16, color: context.theme.badColor),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                AutoRouter.of(context).maybePop(false);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: context.theme.lightGreyColor),
                child: Text(
                  context.language.cancel,
                  style: TextStyleUtils.normal(fontSize: 16, color: context.theme.textColor),
                ),
              ),
            ),
          ],
        );
      },
    ).then((value) async {
      if (value != null && value is bool && value) {
        await onEnd(value);
      }
    });
  }

  static void showPreviewResumeDialog({
    required BuildContext context,
    required ResumeEntity resumeEntity,
    required Function onCreateNew,
    required Function onSaved,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.greenAccent.shade100, Colors.white],
              stops: const [0.0, 1.0],
            ),
          ),
          child: Column(
            children: [
              Container(height: 30),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                child: Image.network(
                  width: MediaQuery.of(context).size.width - 100,
                  resumeEntity.thumbnailUrl,
                  fit: BoxFit.contain,
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    onCreateNew();
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: context.theme.primaryColor),
                    ),
                    child: Center(
                      child: Text(
                        context.language.createNew,
                        style: TextStyleUtils.bold(fontSize: 16, color: context.theme.primaryColor),
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    onSaved();
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: context.theme.primaryColor),
                    ),
                    child: Center(
                      child: Text(
                        context.language.saved,
                        style: TextStyleUtils.bold(fontSize: 16, color: context.theme.primaryColor),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showResumeRecentDialog({
    required BuildContext context,
    required List<UserResumeRecentEntity> listUserResumeRecent,
    required Function(int) onSaved,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        int? selectedId;

        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                color: context.theme.lightGreyColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedId = listUserResumeRecent[index].id;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selectedId == listUserResumeRecent[index].id
                                  ? context.theme.primaryColor
                                  : context.theme.backgroundColor,
                            ),
                            color: context.theme.backgroundColor,
                          ),
                          child: Row(
                            children: [
                              Radio<int>(
                                value: listUserResumeRecent[index].id,
                                groupValue: selectedId,
                                activeColor: context.theme.primaryColor,
                                onChanged: (value) {
                                  setState(() => selectedId = value);
                                },
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listUserResumeRecent[index].title,
                                      style: TextStyleUtils.bold(fontSize: 16, color: context.theme.textColor),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      StringUtils.convertDateTimeString(listUserResumeRecent[index].createdAt),
                                      style: TextStyleUtils.normal(fontSize: 14, color: context.theme.textColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemCount: listUserResumeRecent.length,
                  ),
                  const SizedBox(height: 16),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        if (selectedId != null) {
                          onSaved(selectedId!);
                        }
                      },
                      splashColor: Colors.transparent,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: selectedId != null ? context.theme.primaryColor : context.theme.darkGreyColor,
                        ),
                        child: Center(
                          child: Text(
                            context.language.create,
                            style: TextStyleUtils.bold(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static void showCreateInterviewDialog({
    required BuildContext context,
    required List<UserResumeRecentEntity> listUserResumeRecent,
    required Function(
      TypeCvSourceEnum cvSource,
      TypeCvExperienceLevelEnum experienceLevel,
      TypeLanguageEnum languageUser,
      UserResumeRecentEntity? selectedResume,
    )
    onCreate,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        TypeLanguageEnum language = TypeLanguageEnum.VIETNAMESE;
        TypeCvExperienceLevelEnum experienceLevel = TypeCvExperienceLevelEnum.INTERN;
        TypeCvSourceEnum cvSource = TypeCvSourceEnum.USER_RESUME;
        UserResumeRecentEntity? selectedResume;

        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                color: context.theme.lightGreyColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(context.language.setUpInterview, style: TextStyleUtils.bold(fontSize: 20))],
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    color: context.theme.darkGreyColor,
                  ),
                  Text(context.language.chooseCvSource, style: TextStyleUtils.bold(fontSize: 16)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: TypeCvSourceEnum.values.map((cvSrc) {
                      final isSelected = cvSource == cvSrc;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            cvSource = cvSrc;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: isSelected ? context.theme.primaryColor.withAlpha((255 * 0.1).round()) : null,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: isSelected ? context.theme.primaryColor : context.theme.darkGreyColor,
                            ),
                          ),
                          child: Text(
                            StringUtils.convertTypeCvSourceEnum(cvSrc),
                            style: TextStyleUtils.normal(
                              fontSize: 14,
                              color: isSelected ? context.theme.primaryColor : context.theme.textColor,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  if (cvSource == TypeCvSourceEnum.USER_RESUME) ...[
                    Text(context.language.chooseCv, style: TextStyleUtils.bold(fontSize: 16)),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<UserResumeRecentEntity>(
                      value: selectedResume,
                      hint: Text(context.language.chooseCv),
                      errorBuilder: (context, error) =>
                          Text(error.toString(), style: TextStyleUtils.normal(color: context.theme.badColor)),
                      items: listUserResumeRecent.map((resume) {
                        return DropdownMenuItem<UserResumeRecentEntity>(value: resume, child: Text(resume.title));
                      }).toList(),
                      onChanged: (value) {
                        setState(() => selectedResume = value);
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: context.theme.darkGreyColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: context.theme.primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ] else ...[
                    Text(context.language.uploadCv, style: TextStyleUtils.bold(fontSize: 16)),
                    const SizedBox(height: 8),
                    Container(height: 60, width: double.infinity, color: context.theme.darkGreyColor),
                    const SizedBox(height: 16),
                  ],
                  Text(context.language.chooseExperienceLevel, style: TextStyleUtils.bold(fontSize: 16)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: TypeCvExperienceLevelEnum.values.map((expLevel) {
                      final isSelected = experienceLevel == expLevel;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            experienceLevel = expLevel;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: isSelected ? context.theme.primaryColor.withAlpha((255 * 0.1).round()) : null,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: isSelected ? context.theme.primaryColor : context.theme.darkGreyColor,
                            ),
                          ),
                          child: Text(
                            StringUtils.convertTypeCvExperienceLevelEnum(expLevel),
                            style: TextStyleUtils.normal(
                              fontSize: 14,
                              color: isSelected ? context.theme.primaryColor : context.theme.textColor,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Text(context.language.chooseLanguage, style: TextStyleUtils.bold(fontSize: 16)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: TypeLanguageEnum.values.map((lang) {
                      final isSelected = language == lang;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            language = lang;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: isSelected ? context.theme.primaryColor.withAlpha((255 * 0.1).round()) : null,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: isSelected ? context.theme.primaryColor : context.theme.darkGreyColor,
                            ),
                          ),
                          child: Text(
                            StringUtils.convertTypeLanguageEnum(lang),
                            style: TextStyleUtils.normal(
                              fontSize: 14,
                              color: isSelected ? context.theme.primaryColor : context.theme.textColor,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        onCreate(cvSource, experienceLevel, language, selectedResume);
                      },
                      splashColor: Colors.transparent,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: context.theme.primaryColor,
                        ),
                        child: Center(
                          child: Text(
                            context.language.create,
                            style: TextStyleUtils.bold(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static void showCreateResumeWithAIDialog({
    required BuildContext context,
    required List<UserResumeRecentEntity> listUserResumeRecent,
    required Function(UserResumeRecentEntity? selectedResume) onCreate,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        TypeCreateResumeEnum selectedOption = TypeCreateResumeEnum.NEW;
        UserResumeRecentEntity? selectedResume;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: context.theme.lightGreyColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioListTile<TypeCreateResumeEnum>(
                      value: TypeCreateResumeEnum.NEW,
                      groupValue: selectedOption,
                      activeColor: context.theme.primaryColor,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                          selectedResume = null;
                        });
                      },
                      title: Text(context.language.createNew),
                      contentPadding: EdgeInsets.zero,
                    ),
                    RadioListTile<TypeCreateResumeEnum>(
                      value: TypeCreateResumeEnum.SAVED,
                      groupValue: selectedOption,
                      activeColor: context.theme.primaryColor,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                      title: Text(context.language.saved),
                      contentPadding: EdgeInsets.zero,
                    ),
                    DropdownButtonFormField<UserResumeRecentEntity>(
                      value: selectedResume,
                      hint: Text(context.language.chooseCv),
                      errorBuilder: (context, error) =>
                          Text(error.toString(), style: TextStyleUtils.normal(color: context.theme.badColor)),
                      items: listUserResumeRecent.map((resume) {
                        return DropdownMenuItem<UserResumeRecentEntity>(value: resume, child: Text(resume.title));
                      }).toList(),
                      onChanged: (value) {
                        setState(() => selectedResume = value);
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: context.theme.darkGreyColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: context.theme.primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        onCreate(selectedResume);
                      },
                      splashColor: Colors.transparent,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: context.theme.primaryColor,
                        ),
                        child: Center(
                          child: Text(
                            context.language.create,
                            style: TextStyleUtils.bold(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
