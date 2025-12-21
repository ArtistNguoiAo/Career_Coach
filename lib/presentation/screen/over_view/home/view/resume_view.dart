import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/resume_entity.dart';
import 'package:career_coach/domain/entity/user_resume_recent_entity.dart';
import 'package:career_coach/domain/use_case/get_list_user_resume_recent_use_case.dart';
import 'package:career_coach/presentation/core/di/di_config.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/screen/over_view/home/view/title_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResumeView extends StatefulWidget {
  const ResumeView({
    super.key,
    required this.listResume,
    required this.listUserResumeRecent,
  });

  final List<ResumeEntity> listResume;
  final List<UserResumeRecentEntity> listUserResumeRecent;

  @override
  State<ResumeView> createState() => _ResumeViewState();
}

class _ResumeViewState extends State<ResumeView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final getListUserResumeRecentUseCae = getIt<GetListUserResumeRecentUseCase>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleView(title: context.language.cvTemplate),
        const SizedBox(height: 8),
        Container(
          height: 300,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _itemResume(
                resumeEntity: widget.listResume[index],
              );
            },
            separatorBuilder: (_, __) => SizedBox(width: 16),
            itemCount: widget.listResume.length,
          ),
        ),
      ],
    );
  }

  Widget _itemResume({
    required ResumeEntity resumeEntity,
  }) {
    return InkWell(
      onTap: () {
        DialogUtils.showPreviewResumeDialog(
          context: context,
          resumeEntity: resumeEntity,
          onCreateNew: () {
            context.router.push(
              PreviewResumeRoute(
                resumeId: resumeEntity.id,
                isCreateNew: true,
              ),
            );
          },
          onSaved: () async {
            final listUserResumeRecent = await getListUserResumeRecentUseCae.call(limit: 3);
            if (!mounted) return;
            DialogUtils.showResumeRecentDialog(
              context: context,
              listUserResumeRecent: listUserResumeRecent,
              onSaved: (userResumeId) {
                context.router.push(
                  PreviewResumeRoute(
                    resumeId: resumeEntity.id,
                    userResumeId: userResumeId,
                    isCreateNew: true,
                  ),
                );
              },
            );
          }
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
                  color: context.theme.darkGreyColor,
                ),
                SizedBox(width: 4),
                Text(
                  resumeEntity.viewCount.toString(),
                  style: TextStyleUtils.normal(
                    fontSize: 14,
                    color: context.theme.darkGreyColor,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  FontAwesomeIcons.download,
                  size: 14,
                  color: context.theme.darkGreyColor,
                ),
                SizedBox(width: 4),
                Text(
                  resumeEntity.downloadCount.toString(),
                  style: TextStyleUtils.normal(
                    fontSize: 14,
                    color: context.theme.darkGreyColor,
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
