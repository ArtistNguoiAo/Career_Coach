import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/enum/type_interview_status_enum.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/core/utils/string_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/screen/over_view/list_interview/cubit/list_interview_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ListInterviewScreen extends StatelessWidget {
  const ListInterviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ListInterviewCubit()..init(), child: const ListInterviewScreenUI());
  }
}

class ListInterviewScreenUI extends StatefulWidget {
  const ListInterviewScreenUI({super.key});

  @override
  State<ListInterviewScreenUI> createState() => _ListInterviewScreenUIState();
}

class _ListInterviewScreenUIState extends State<ListInterviewScreenUI> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _activeScrollController = ScrollController();
  final ScrollController _historyScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _activeScrollController.addListener(_onActiveScroll);
    _historyScrollController.addListener(_onHistoryScroll);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _activeScrollController.dispose();
    _historyScrollController.dispose();
    super.dispose();
  }

  void _onActiveScroll() {
    if (_activeScrollController.position.pixels >= _activeScrollController.position.maxScrollExtent * 0.9) {
      context.read<ListInterviewCubit>().loadMoreActiveInterviews();
    }
  }

  void _onHistoryScroll() {
    if (_historyScrollController.position.pixels >= _historyScrollController.position.maxScrollExtent * 0.9) {
      context.read<ListInterviewCubit>().loadMoreHistoryInterviews();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 16, right: 16, bottom: 16),
        color: context.theme.backgroundColor,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              dividerColor: Colors.transparent,
              indicatorColor: context.theme.primaryColor,
              labelColor: context.theme.primaryColor,
              unselectedLabelColor: context.theme.borderColor,
              tabs: const [
                Tab(text: 'Đang diễn ra'),
                Tab(text: 'Lịch sử'),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildInterviewList(true, _activeScrollController),
                  _buildInterviewList(false, _historyScrollController),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        backgroundColor: context.theme.primaryColor,
        child: Icon(FontAwesomeIcons.plus, color: context.theme.backgroundColor),
      ),
    );
  }

  Widget _buildInterviewList(bool isActive, ScrollController scrollController) {
    return BlocBuilder<ListInterviewCubit, ListInterviewState>(
      builder: (context, state) {
        final interviews = isActive ? state.listInterviewActive : state.listInterviewHistory;

        return RefreshIndicator(
          onRefresh: () async {
            await context.read<ListInterviewCubit>().init();
          },
          child: ListView.separated(
            controller: scrollController,
            padding: EdgeInsets.zero,
            itemCount: interviews.length,
            separatorBuilder: (context, index) => Container(height: 8),
            itemBuilder: (context, index) {
              final interview = interviews[index];
              return InkWell(
                onTap: () {
                  AutoRouter.of(context).push(MessageRoute(sessionId: interview.id));
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.theme.lightGreyColor.withAlpha((255 * 0.5).round()),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringUtils.convertTypeCvExperienceLevelEnum(interview.experienceLevel),
                            style: TextStyleUtils.bold(color: context.theme.textColor, fontSize: 16),
                          ),
                          Text(
                            StringUtils.convertDateTimeString(interview.createdAt),
                            style: TextStyleUtils.normal(color: context.theme.darkGreyColor, fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: interview.status == TypeInterviewStatusEnum.ACTIVE
                                  ? context.theme.goodColor.withAlpha((255 * 0.1).round())
                                  : interview.status == TypeInterviewStatusEnum.COMPLETED
                                  ? context.theme.mediumColor.withAlpha((255 * 0.1).round())
                                  : context.theme.badColor.withAlpha((255 * 0.1).round()),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              StringUtils.convertTypeInterviewStatusEnum(interview.status),
                              style: TextStyleUtils.bold(
                                fontSize: 12,
                                color: interview.status == TypeInterviewStatusEnum.ACTIVE
                                    ? context.theme.goodColor
                                    : interview.status == TypeInterviewStatusEnum.COMPLETED
                                    ? context.theme.mediumColor
                                    : context.theme.badColor,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.withAlpha((255 * 0.1).round()),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              StringUtils.convertTypeLanguageEnum(interview.language),
                              style: TextStyleUtils.bold(
                                fontSize: 12,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.teal.withAlpha((255 * 0.1).round()),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              StringUtils.convertTypeCvSourceEnum(interview.cvSource),
                              style: TextStyleUtils.bold(
                                fontSize: 12,
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
