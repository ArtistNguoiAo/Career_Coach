import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_text_field.dart';
import 'package:career_coach/presentation/screen/preview_resume/cubit/preview_resume_cubit.dart';
import 'package:career_coach/presentation/screen/preview_resume/widgets/drawer_preview_resume.dart';
import 'package:career_coach/presentation/screen/preview_resume/widgets/end_drawer_preview_resume.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';

@RoutePage()
class PreviewResumeScreen extends StatefulWidget {
  const PreviewResumeScreen({super.key, this.resumeId, this.userResumeId, required this.isCreateNew});

  final int? resumeId;
  final int? userResumeId;
  final bool isCreateNew;

  @override
  State<PreviewResumeScreen> createState() => _PreviewResumeScreenState();
}

class _PreviewResumeScreenState extends State<PreviewResumeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PreviewResumeCubit()
            ..init(resumeId: widget.resumeId, userResumeId: widget.userResumeId, isCreateNew: widget.isCreateNew),
      child: BlocConsumer<PreviewResumeCubit, PreviewResumeState>(
        listener: (context, state) {
          _nameController.text = state.userResumeEntity?.title ?? '';
        },
        builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: [SizedBox.shrink()],
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => AutoRouter.of(context).maybePop(),
                    child: Icon(FontAwesomeIcons.chevronLeft, color: context.theme.backgroundColor, size: 20),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: BaseTextField(
                        controller: _nameController,
                        isCollapsed: true,
                        fillColor: context.theme.backgroundColor,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        textAlign: TextAlign.center,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: context.theme.borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: context.theme.borderColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      context.read<PreviewResumeCubit>().saveUserResume(
                        userResumeEntity: state.userResumeEntity!.copyWith(title: _nameController.text),
                      );
                    },
                    child: Icon(FontAwesomeIcons.floppyDisk, color: context.theme.backgroundColor, size: 20),
                  ),
                ],
              ),
              backgroundColor: context.theme.primaryColor,
            ),
            body: Container(
              padding: const EdgeInsets.all(16),
              color: context.theme.backgroundColor,
              child: Column(
                children: [
                  _headerRow(),
                  Expanded(child: _body(state.pdfData)),
                  _footerRow(state.userResumeEntity),
                ],
              ),
            ),
            drawer: DrawerPreviewResume(
              userResumeEntity: state.userResumeEntity,
            ),
            endDrawer: EndDrawerPreviewResume(
              userResumeEntity: state.userResumeEntity,
              onChanged: (userResumeEntity) {
                context.read<PreviewResumeCubit>().saveUserResume(userResumeEntity: userResumeEntity);
              },
            ),
            drawerEnableOpenDragGesture: false,
            endDrawerEnableOpenDragGesture: false,
          );
        },
      ),
    );
  }

  Widget _headerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.language.changeTemplate,
          style: TextStyleUtils.bold(color: context.theme.primaryColor, fontSize: 16),
        ),
      ],
    );
  }

  Widget _body(List<int> pdfData) {
    return FutureBuilder<File>(
      future: _writePdfToTemp(pdfData),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text('Không thể tải file PDF'),
          );
        }

        final file = snapshot.data!;
        return PDFView(
          filePath: file.path,
          enableSwipe: true,
          swipeHorizontal: false,
          autoSpacing: true,
          pageFling: true,
          onError: (error) {
            debugPrint('PDF error: $error');
          },
          onPageError: (page, error) {
            debugPrint('Page error: $page - $error');
          },
        );
      },
    );
  }

  Future<File> _writePdfToTemp(List<int> bytes) async {
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/preview_resume.pdf');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  Widget _footerRow(UserResumeEntity? userResumeEntity) {
    return Builder(
      builder: (context) {
        return Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: context.theme.primaryColor),
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.pencil, size: 12, color: context.theme.textColor),
                      const SizedBox(height: 4),
                      Text(context.language.content, style: TextStyleUtils.bold(color: context.theme.textColor, fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: InkWell(
                onTap: () async {
                  if (userResumeEntity == null) return;
                  final result = await AutoRouter.of(
                    context,
                  ).push(LayoutResumeRoute(userResumeEntity: userResumeEntity));

                  if (!context.mounted) return;

                  if (result is UserResumeEntity) {
                    context.read<PreviewResumeCubit>().saveUserResume(userResumeEntity: result);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: context.theme.primaryColor),
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.puzzlePiece, size: 12, color: context.theme.textColor),
                      const SizedBox(height: 4),
                      Text(context.language.layout, style: TextStyleUtils.bold(color: context.theme.textColor, fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: InkWell(
                onTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: context.theme.primaryColor),
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.palette, size: 12, color: context.theme.textColor),
                      const SizedBox(height: 4),
                      Text(context.language.theme, style: TextStyleUtils.bold(color: context.theme.textColor, fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
