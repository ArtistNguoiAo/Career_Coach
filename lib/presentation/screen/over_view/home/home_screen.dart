import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/screen/over_view/home/cubit/home_cubit.dart';
import 'package:career_coach/presentation/screen/over_view/home/view/header_view.dart';
import 'package:career_coach/presentation/screen/over_view/home/view/resume_view.dart';
import 'package:career_coach/presentation/screen/over_view/home/view/title_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit()..init(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  HeaderView(),
                  const SizedBox(height: 16),
                  ResumeView(
                    listResume: state.listResume,
                    listUserResumeRecent: state.listUserResumeRecent,
                  ),
                  const SizedBox(height: 16),
                  _outstanding(),
                  const SizedBox(height: 16),
                  _tool(),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _outstanding() {
    return Column(
      children: [
        TitleView(title: context.language.outstanding),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 150,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.7,
              onPageChanged: (index, reason) {},
            ),
            items: [
              Container(
                width: double.infinity,
                color: context.theme.primaryColor,
              ),
              Container(
                width: double.infinity,
                color: context.theme.primaryColor,
              ),
              Container(
                width: double.infinity,
                color: context.theme.primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tool() {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(ManageUserResumeRoute());
      },
      child: Column(
        children: [
          TitleView(title: context.language.tool),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: context.theme.backgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: context.theme.textColor.withAlpha((255 * 0.1).round()),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    FontAwesomeIcons.calculator,
                    color: context.theme.backgroundColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    context.language.calculateGrossNetSalary,
                    style: TextStyleUtils.normal(
                      color: context.theme.textColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  FontAwesomeIcons.anglesRight,
                  color: context.theme.textColor,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
