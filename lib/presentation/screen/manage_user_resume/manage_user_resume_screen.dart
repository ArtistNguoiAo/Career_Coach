import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/screen/manage_user_resume/cubit/manage_user_resume_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ManageUserResumeScreen extends StatefulWidget {
  const ManageUserResumeScreen({super.key});

  @override
  State<ManageUserResumeScreen> createState() => _ManageUserResumeScreenState();
}

class _ManageUserResumeScreenState extends State<ManageUserResumeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageUserResumeCubit()..init(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Manage User Resume')),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: _body(),
        ),
      ),
    );
  }

  Widget _body() {
    return BlocConsumer<ManageUserResumeCubit, ManageUserResumeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                AutoRouter.of(
                  context,
                ).push(PreviewResumeRoute(userResumeId: state.listUserResume[index].id, isCreateNew: false));
              },
              child: ListTile(
                title: Text(state.listUserResume[index].title),
                subtitle: Text('Last updated: ${state.listUserResume[index].title}'),
                trailing: IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemCount: state.listUserResume.length,
        );
      },
    );
  }
}
