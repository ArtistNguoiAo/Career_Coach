import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
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
  final List<String> tabs = [
    'Tất cả',
    'Cơ bản',
    'Hiện đại',
    'Sáng tạo',
    'Chuyên nghiệp',
    'Kỹ thuật',
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListCvCubit()..init(),
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

            },
            builder: (context, state) {
              return Column(
                children: [
                  Wrap(
                    spacing: 8,
                    children: List.generate(tabs.length, (index) {
                      final isSelected = selectedIndex == index;

                      return ChoiceChip(
                        label: Text(
                          tabs[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: context.theme.primaryColor,
                        checkmarkColor: Colors.white,
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey.shade300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onSelected: (_) {
                          setState(() => selectedIndex = index);
                        },
                      );
                    }),
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
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: context.theme.borderColor),
                            color: context.theme.backgroundColor,
                          ),
                          child: Column(
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
