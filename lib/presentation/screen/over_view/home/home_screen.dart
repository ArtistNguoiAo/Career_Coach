import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/screen/over_view/home/cubit/home_cubit.dart';
import 'package:career_coach/presentation/screen/over_view/home/view/create_cv_with_ai_view.dart';
import 'package:career_coach/presentation/screen/over_view/home/view/header_view.dart';
import 'package:career_coach/presentation/screen/over_view/home/view/resume_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
                    CreateCvWithAIView(listUserResumeRecent: state.listUserResumeRecent),
                    const SizedBox(height: 16),
                    ResumeView(listResume: state.listResume, listUserResumeRecent: state.listUserResumeRecent),
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
}
