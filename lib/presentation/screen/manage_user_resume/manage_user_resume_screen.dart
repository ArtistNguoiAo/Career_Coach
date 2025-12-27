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
  final Set<int> _selectedResumes = {};
  bool _isSelectionMode = false;

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
    _selectedResumes.clear();
    super.dispose();
  }

  void _toggleSelection(int resumeId) {
    setState(() {
      if (_selectedResumes.contains(resumeId)) {
        _selectedResumes.remove(resumeId);
      } else {
        _selectedResumes.add(resumeId);
      }
      _isSelectionMode = true;
    });
  }

  void _exitSelectionMode() {
    setState(() {
      _selectedResumes.clear();
      _isSelectionMode = false;
    });
  }

  void _toggleSelectAll() {
    setState(() {
      final currentResumes = _tabController.index == 0
          ? context.read<ManageUserResumeCubit>().state.listUserResumeSaved
          : context.read<ManageUserResumeCubit>().state.listUserResumeDraft;

      if (_selectedResumes.length == currentResumes.length) {
        _selectedResumes.clear();
      } else {
        _selectedResumes.clear();
        _selectedResumes.addAll(currentResumes.map((r) => r.id).toList());
      }
      _isSelectionMode = true;
    });
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
        leading: _isSelectionMode
            ? InkWell(
                onTap: _exitSelectionMode,
                child: Icon(FontAwesomeIcons.xmark, color: context.theme.backgroundColor, size: 20),
              )
            : InkWell(
                onTap: () {
                  AutoRouter.of(context).maybePop();
                },
                child: Icon(FontAwesomeIcons.chevronLeft, color: context.theme.backgroundColor, size: 20),
              ),
        centerTitle: true,
        title: _isSelectionMode
            ? Text(
                '${_selectedResumes.length} ${context.language.selected}',
                style: TextStyleUtils.bold(color: context.theme.backgroundColor, fontSize: 18),
              )
            : Text(
                context.language.yourResume,
                style: TextStyleUtils.bold(color: context.theme.backgroundColor, fontSize: 18),
              ),
        backgroundColor: context.theme.primaryColor,
        actions: [
          if (_isSelectionMode) ...[
            Builder(
              builder: (context) {
                return InkWell(
                  onTap: () {
                    context.read<ManageUserResumeCubit>().deleteUserResumeBatch(_selectedResumes.toList());
                  },
                  child: Icon(FontAwesomeIcons.trash, size: 20, color: Colors.white),
                );
              }
            ),
            SizedBox(width: 16),
            InkWell(
              onTap: _toggleSelectAll,
              child: Icon(
                _selectedResumes.isNotEmpty &&
                        ((_tabController.index == 0 &&
                                _selectedResumes.length ==
                                    context.read<ManageUserResumeCubit>().state.listUserResumeSaved.length) ||
                            (_tabController.index == 1 &&
                                _selectedResumes.length ==
                                    context.read<ManageUserResumeCubit>().state.listUserResumeDraft.length))
                    ? FontAwesomeIcons.squareCheck
                    : FontAwesomeIcons.square,
                color: Colors.white,
                size: 20,
              ),
            ),
            SizedBox(width: 16),
          ],
        ],
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
        if(state.isDeleteSuccess) {
          state.isDeleteSuccess = false;
          _selectedResumes.clear();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                context.language.deleteSuccess,
                style: TextStyleUtils.normal(color: context.theme.backgroundColor, fontSize: 12),
              ),
              backgroundColor: context.theme.goodColor,
              duration: const Duration(seconds: 1),
            ),
          );
        }
        if (state.error.isNotEmpty) {
          DialogUtils.showErrorDialog(context: context, message: state.error);
          state.error = '';
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
              final isSelected = _selectedResumes.contains(userResume.id);
              return InkWell(
                onTap: _isSelectionMode
                    ? () => _toggleSelection(userResume.id)
                    : () {
                        AutoRouter.of(
                          context,
                        ).push(PreviewResumeRoute(isCreateNew: false, userResumeId: userResume.id)).then((_) {
                          context.read<ManageUserResumeCubit>().init();
                        });
                      },
                onLongPress: () {
                  setState(() {
                    _toggleSelection(userResume.id);
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.theme.lightGreyColor.withAlpha((255 * 0.5).round()),
                    border: isSelected ? Border.all(color: context.theme.primaryColor, width: 2) : null,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_isSelectionMode) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Checkbox(
                              value: isSelected,
                              onChanged: (_) => _toggleSelection(userResume.id),
                              checkColor: context.theme.backgroundColor,
                              activeColor: context.theme.primaryColor,
                            ),
                          ],
                        ),
                      ],
                      Expanded(child: Container()),
                      Text(
                        userResume.title,
                        style: TextStyleUtils.normal(color: context.theme.textColor, fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
