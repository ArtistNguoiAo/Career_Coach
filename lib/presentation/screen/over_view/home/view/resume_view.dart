import 'package:career_coach/domain/entity/resume_entity.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/screen/over_view/home/view/title_view.dart';
import 'package:flutter/material.dart';

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
          height: 250,
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
                separatorBuilder: (_, __) => SizedBox(width: 8),
                itemCount: widget.listResume.length,
              ),
              ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _itemResume(widget.listResume[index]);
                },
                separatorBuilder: (_, __) => SizedBox(width: 8),
                itemCount: widget.listResume.length,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _itemResume(ResumeEntity resumeEntity) {
    return Column(
      children: [
        Expanded(
          child: Image.network(
            resumeEntity.thumbnailUrl,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          resumeEntity.title,
          style: TextStyleUtils.normal(
            color: context.theme.textColor,
          ),
        ),
      ],
    );
  }
}
