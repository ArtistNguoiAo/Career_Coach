import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/resume_entity.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/screen/over_view/home/view/title_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResumeView extends StatefulWidget {
  const ResumeView({super.key, required this.listResume});

  final List<ResumeEntity> listResume;

  @override
  State<ResumeView> createState() => _ResumeViewState();
}

class _ResumeViewState extends State<ResumeView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleView(title: context.language.cvAndCl),
        TabBar(
          controller: tabController,
          dividerColor: Colors.transparent,
          indicatorColor: context.theme.primaryColor,
          labelColor: context.theme.primaryColor,
          unselectedLabelColor: context.theme.borderColor,
          tabs: [
            Tab(text: context.language.cv),
            Tab(text: context.language.cl),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 300,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _itemResume(widget.listResume[index]);
                },
                separatorBuilder: (_, __) => SizedBox(width: 16),
                itemCount: widget.listResume.length,
              ),
              ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _itemResume(widget.listResume[index]);
                },
                separatorBuilder: (_, __) => SizedBox(width: 16),
                itemCount: widget.listResume.length,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _itemResume(ResumeEntity resumeEntity) {
    return InkWell(
      onTap: () {
        DialogUtils.showPreviewResumeDialog(
          context: context,
          resumeImageUrl: resumeEntity.thumbnailUrl,
          onUseTemplate: (value) {
            AutoRouter.of(
              context,
            ).push(PreviewResumeRoute(resumeEntity: resumeEntity));
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: context.theme.borderColor),
          color: context.theme.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                child: Banner(
                  message: resumeEntity.type.name,
                  location: BannerLocation.topEnd,
                  color: context.theme.goodColor,
                  child: Image.network(
                    resumeEntity.thumbnailUrl,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                resumeEntity.title,
                style: TextStyleUtils.bold(color: context.theme.textColor),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 8),
                Icon(
                  FontAwesomeIcons.eye,
                  size: 14,
                  color: context.theme.iconFeatureColor,
                ),
                SizedBox(width: 4),
                Text(
                  resumeEntity.viewCount.toString(),
                  style: TextStyleUtils.normal(
                    fontSize: 14,
                    color: context.theme.iconFeatureColor,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  FontAwesomeIcons.download,
                  size: 14,
                  color: context.theme.iconFeatureColor,
                ),
                SizedBox(width: 4),
                Text(
                  resumeEntity.downloadCount.toString(),
                  style: TextStyleUtils.normal(
                    fontSize: 14,
                    color: context.theme.iconFeatureColor,
                  ),
                ),
                SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
