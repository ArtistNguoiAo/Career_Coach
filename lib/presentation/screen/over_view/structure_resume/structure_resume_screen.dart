import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/core/utils/string_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class StructureResumeScreen extends StatefulWidget {
  const StructureResumeScreen({super.key});

  @override
  State<StructureResumeScreen> createState() => _StructureResumeScreenState();
}

class _StructureResumeScreenState extends State<StructureResumeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                AutoRouter.of(context).maybePop();
              },
              child: Text(
                context.language.cancel,
                style: TextStyleUtils.normal(color: Colors.white, fontSize: 14),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  context.language.editContent,
                  textAlign: TextAlign.center,
                  style: TextStyleUtils.bold(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                context.language.save,
                style: TextStyleUtils.normal(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
        backgroundColor: context.theme.primaryColor,
      ),
      body: Container(
        color: context.theme.backgroundColor,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: _listSectionItem()),
            SizedBox(height: 16),
            _buttonAddSection(),
          ],
        ),
      ),
    );
  }

  Widget _listSectionItem() {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return _sectionItem(
          title: StringUtils.getListResumeSections(context)[index],
          isChange: StringUtils.getListResumeSections(context)[index] ==
              context.language.contactInformation,
        );
      },
      separatorBuilder: (_, __) => SizedBox(height: 12),
      itemCount: StringUtils.getListResumeSections(context).length,
    );
  }

  Widget _sectionItem({required String title, required bool isChange}) {
    return InkWell(
      onTap: () {
        if(title == context.language.contactInformation) {
          AutoRouter.of(context).push(ContactInformationRoute());
        }
        else if(title == context.language.avatar) {
          AutoRouter.of(context).push(AvatarRoute());
        }
        else if(title == context.language.workExperience) {
          AutoRouter.of(context).push(WorkExperienceRoute());
        }
        else if(title == context.language.project) {
          AutoRouter.of(context).push(ProjectRoute());
        }
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.theme.lightGreyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              size: 20,
              isChange ? FontAwesomeIcons.diceD6 : FontAwesomeIcons.thumbtack,
              color: context.theme.darkGreyColor,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyleUtils.bold(
                  color: context.theme.textColor,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Icon(
              size: 20,
              FontAwesomeIcons.pen,
              color: context.theme.darkGreyColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonAddSection() {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Container(
              decoration: BoxDecoration(
                color: context.theme.lightGreyColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: context.theme.backgroundColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                StringUtils.getListResumeSections(context)[index],
                                style: TextStyleUtils.normal(
                                  color: context.theme.textColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: context.theme.primaryColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: const EdgeInsets.all(2),
                              child: Icon(
                                size: 14,
                                FontAwesomeIcons.check,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => SizedBox(height: 8),
                    itemCount: StringUtils.getListResumeSections(context).length,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: context.theme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                    child: Text(
                      context.language.save,
                      style: TextStyleUtils.bold(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
        ).then((value) async {
          if (value != null) {}
        });
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.theme.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Text(
          context.language.addSection,
          style: TextStyleUtils.bold(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
