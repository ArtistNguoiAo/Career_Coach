import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/enum/type_resume_section_enum.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/core/utils/string_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerPreviewResume extends StatefulWidget {
  const DrawerPreviewResume({super.key, required this.userResumeEntity});

  final UserResumeEntity? userResumeEntity;

  @override
  State<DrawerPreviewResume> createState() => _DrawerPreviewResumeState();
}

class _DrawerPreviewResumeState extends State<DrawerPreviewResume> {
  List<TypeResumeSectionEnum> sections = [];

  @override
  void initState() {
    if (widget.userResumeEntity?.numberOfColumns == 1) {
      sections = [...?widget.userResumeEntity?.layouts.firstOrNull?.sections];
    } else if (widget.userResumeEntity?.numberOfColumns == 2) {
      sections = [...?widget.userResumeEntity?.layouts[0].sections, ...?widget.userResumeEntity?.layouts[1].sections];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight),
      child: Drawer(
        child: Container(
          color: context.theme.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(context.language.chooseSection, style: TextStyleUtils.bold(fontSize: 16)),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 16),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (sections[index] == TypeResumeSectionEnum.CONTACT_INFORMATION) {
                          AutoRouter.of(
                            context,
                          ).push(ContactInformationRoute(userResumeId: widget.userResumeEntity?.id ?? 0));
                        }
                        else if (sections[index] == TypeResumeSectionEnum.GOAL) {
                          AutoRouter.of(
                            context,
                          ).push(GoalRoute(userResumeId: widget.userResumeEntity?.id ?? 0));
                        }
                        else if(sections[index] == TypeResumeSectionEnum.SKILL) {
                          AutoRouter.of(
                            context,
                          ).push(SkillRoute(userResumeId: widget.userResumeEntity?.id ?? 0));
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(left: 16.0, right: 16, top: 4),
                        decoration: BoxDecoration(
                          color: context.theme.backgroundColor,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black26, offset: Offset(0, 2))],
                        ),
                        child: Row(
                          children: [
                            Icon(FontAwesomeIcons.puzzlePiece, size: 16, color: context.theme.darkGreyColor),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                StringUtils.convertTypeResumeSectionEnum(context, sections[index]),
                                style: TextStyleUtils.normal(color: context.theme.textColor, fontSize: 14),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => Container(height: 8),
                  itemCount: sections.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
