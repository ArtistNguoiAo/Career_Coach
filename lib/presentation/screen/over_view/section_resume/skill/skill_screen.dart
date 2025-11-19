import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class SkillScreen extends StatefulWidget {
  const SkillScreen({super.key});

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            AutoRouter.of(context).maybePop();
          },
          child: Icon(
            FontAwesomeIcons.chevronLeft,
            color: context.theme.backgroundColor,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: Text(
          context.language.skill,
          style: TextStyleUtils.bold(
            color: context.theme.backgroundColor,
            fontSize: 18,
          ),
        ),
        backgroundColor: context.theme.primaryColor,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        color: context.theme.backgroundColor,
        child: Column(
          children: [
            Expanded(child: _listView()),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.theme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    child: Text(
                      context.language.save,
                      style: TextStyleUtils.bold(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.theme.primaryColor.withAlpha(
                        (255 * 0.1).round(),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    child: Text(
                      context.language.add,
                      style: TextStyleUtils.bold(
                        color: context.theme.primaryColor,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _listView() {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            AutoRouter.of(context).push(SkillDetailRoute());
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: context.theme.lightGreyColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(
                  size: 20,
                  FontAwesomeIcons.diceD6,
                  color: context.theme.darkGreyColor,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    "Ielts - 8.0",
                    style: TextStyleUtils.bold(
                      color: context.theme.textColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  size: 20,
                  FontAwesomeIcons.trash,
                  color: context.theme.darkGreyColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
