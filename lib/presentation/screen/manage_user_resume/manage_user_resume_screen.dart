import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/screen/manage_user_resume/cubit/manage_user_resume_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ManageUserResumeScreen extends StatelessWidget {
  const ManageUserResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ManageUserResumeCubit()..init(), child: ManageUserResumeScreenUI());
  }
}

class ManageUserResumeScreenUI extends StatefulWidget {
  const ManageUserResumeScreenUI({super.key});

  @override
  State<ManageUserResumeScreenUI> createState() => _ManageUserResumeScreenUIState();
}

class _ManageUserResumeScreenUIState extends State<ManageUserResumeScreenUI> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _savedScrollController = ScrollController();
  final ScrollController _draftScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _savedScrollController.addListener(_onSavedScroll);
    _draftScrollController.addListener(_onDraftScroll);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _savedScrollController.dispose();
    _draftScrollController.dispose();
    super.dispose();
  }

  void _onSavedScroll() {
    if (_savedScrollController.position.pixels >= _savedScrollController.position.maxScrollExtent * 0.9) {
      context.read<ManageUserResumeCubit>().loadMoreSavedUserResume();
    }
  }

  void _onDraftScroll() {
    if (_draftScrollController.position.pixels >= _draftScrollController.position.maxScrollExtent * 0.9) {
      context.read<ManageUserResumeCubit>().loadMoreDraftUserResume();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            AutoRouter.of(context).maybePop();
          },
          child: Icon(FontAwesomeIcons.chevronLeft, color: context.theme.backgroundColor, size: 20),
        ),
        centerTitle: true,
        title: Text(
          context.language.yourResume,
          style: TextStyleUtils.bold(color: context.theme.backgroundColor, fontSize: 18),
        ),
        backgroundColor: context.theme.primaryColor,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: context.theme.backgroundColor,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          dividerColor: Colors.transparent,
          indicatorColor: context.theme.primaryColor,
          labelColor: context.theme.primaryColor,
          unselectedLabelColor: context.theme.borderColor,
          tabs: [
            Tab(text: context.language.saved),
            Tab(text: context.language.draft),
          ],
        ),
        SizedBox(height: 8),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildUserResumeList(true, _savedScrollController),
              _buildUserResumeList(false, _draftScrollController),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserResumeList(bool isSaved, ScrollController scrollController) {
    return BlocConsumer<ManageUserResumeCubit, ManageUserResumeState>(
      listener: (context, state) {
        if (state.isLoading) {
          DialogUtils.showLoadingDialog(context);
        } else {
          DialogUtils.hideLoadingDialog(context);
        }
      },
      builder: (context, state) {
        final userResumes = isSaved ? state.listUserResumeSaved : state.listUserResumeDraft;

        return RefreshIndicator(
          color: context.theme.primaryColor,
          backgroundColor: Colors.white,
          onRefresh: () async {
            await context.read<ManageUserResumeCubit>().init();
          },
          child: GridView.builder(
            controller: scrollController,
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 2 / 3,
            ),
            itemCount: userResumes.length,
            itemBuilder: (context, index) {
              final userResume = userResumes[index];
              return InkWell(
                onTap: () {
                  AutoRouter.of(context).push(
                    PreviewResumeRoute(isCreateNew: false, userResumeId: userResume.id)
                  ).then((_) {
                    context.read<ManageUserResumeCubit>().init();
                  });
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
                            userResume.title,
                            style: TextStyleUtils.bold(color: context.theme.textColor, fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
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
