import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/enum/type_resume_enum.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/string_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/screen/list_cv/cubit/list_cv_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ListCvScreen extends StatefulWidget {
  const ListCvScreen({super.key});

  @override
  State<ListCvScreen> createState() => _ListCvScreenState();
}

class _ListCvScreenState extends State<ListCvScreen> {
  TypeResumeEnum selectedType = TypeResumeEnum.ALL;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListCvCubit()..init(typeResumeEnum: selectedType),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              AutoRouter.of(context).maybePop();
            },
            child: Icon(FontAwesomeIcons.chevronLeft, color: context.theme.backgroundColor, size: 20),
          ),
          centerTitle: true,
          title: Text(
            context.language.cv,
            style: TextStyleUtils.bold(color: context.theme.backgroundColor, fontSize: 18),
          ),
          backgroundColor: context.theme.primaryColor,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          color: context.theme.backgroundColor,
          child: BlocConsumer<ListCvCubit, ListCvState>(
            listener: (context, state) {
              selectedType = state.selectedType;
            },
            builder: (context, state) {
              return Column(
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: TypeResumeEnum.values.map((type) {
                      final isSelected = selectedType == type;
                      return InkWell(
                        onTap: () {
                          context.read<ListCvCubit>().init(typeResumeEnum: type);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: isSelected ? context.theme.primaryColor.withAlpha((255 * 0.1).round()) : null,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: isSelected ? context.theme.primaryColor : context.theme.darkGreyColor,
                            ),
                          ),
                          child: Text(
                            StringUtils.convertTypeResumeEnum(context, type),
                            style: TextStyleUtils.normal(
                              fontSize: 14,
                              color: isSelected ? context.theme.primaryColor : context.theme.textColor,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1 / 2,
                      ),
                      itemCount: state.listResume.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            DialogUtils.showPreviewResumeDialog(
                                context: context,
                                resumeEntity: state.listResume[index],
                                onCreateNew: () {
                                  context.router.push(
                                    PreviewResumeRoute(
                                      resumeId: state.listResume[index].id,
                                      isCreateNew: true,
                                      isCreateWithAI: false,
                                    ),
                                  );
                                },
                                onSaved: () async {
                                  if (!mounted) return;
                                  DialogUtils.showResumeRecentDialog(
                                    context: context,
                                    listUserResumeRecent: state.listUserResumeRecent,
                                    onSaved: (userResumeId) {
                                      context.router.push(
                                        PreviewResumeRoute(
                                          resumeId: state.listResume[index].id,
                                          userResumeId: userResumeId,
                                          isCreateNew: true,
                                          isCreateWithAI: false,
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
                                      message: state.listResume[index].type.name,
                                      location: BannerLocation.topEnd,
                                      color: context.theme.goodColor,
                                      child: Image.network(
                                        state.listResume[index].thumbnailUrl,
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
                                    state.listResume[index].title,
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
                                      state.listResume[index].viewCount.toString(),
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
                                      state.listResume[index].downloadCount.toString(),
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
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
