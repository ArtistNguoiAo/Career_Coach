import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/core/utils/media_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_text_field.dart';
import 'package:career_coach/presentation/screen/over_view/home/cubit/home_cubit.dart';
import 'package:career_coach/presentation/screen/over_view/home/view/header_view.dart';
import 'package:career_coach/presentation/screen/over_view/home/view/resume_view.dart';
import 'package:career_coach/presentation/screen/over_view/home/view/title_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..init(),
      child: Scaffold(
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state.error.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            return Container(
              color: context.theme.backgroundColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HeaderView(userEntity: state.userEntity),
                    const SizedBox(height: 16),
                    _createCvWithAI(),
                    const SizedBox(height: 16),
                    ResumeView(listResume: state.listResume, listUserResumeRecent: state.listUserResumeRecent),
                    const SizedBox(height: 16),
                    _tool(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _createCvWithAI() {
    return Column(
      children: [
        TitleView(title: context.language.createCvWithAI),
        const SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Lottie.asset(MediaUtils.ltBot, width: 80, fit: BoxFit.cover),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  context.language.createCvWithAIContent,
                  style: TextStyleUtils.normal(color: context.theme.primaryDarkColor, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BaseTextField(
            controller: _contentController,
            textInputAction: TextInputAction.newline,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: context.theme.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: context.theme.primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: context.theme.borderColor),
            ),
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () {

          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(color: context.theme.primaryColor, borderRadius: BorderRadius.circular(4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.wandMagicSparkles, color: Colors.white, size: 16),
                const SizedBox(width: 8),
                Text(
                  context.language.create,
                  style: TextStyleUtils.bold(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
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
                  child: Icon(FontAwesomeIcons.calculator, color: context.theme.backgroundColor, size: 20),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    context.language.calculateGrossNetSalary,
                    style: TextStyleUtils.normal(color: context.theme.textColor, fontSize: 16),
                  ),
                ),
                const SizedBox(width: 8),
                Icon(FontAwesomeIcons.anglesRight, color: context.theme.textColor, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
