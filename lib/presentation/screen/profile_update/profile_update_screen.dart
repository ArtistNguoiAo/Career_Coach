import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/user_entity.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key, required this.userEntity});

  final UserEntity userEntity;

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => context.router.pop(),
          child: Icon(
            FontAwesomeIcons.chevronLeft,
            color: context.theme.backgroundColor,
            size: 24,
          ),
        ),
        centerTitle: true,
        title: Text(
          context.language.profileUpdate,
          style: TextStyleUtils.bold(
            color: context.theme.backgroundColor,
            fontSize: 20,
          ),
        ),
        backgroundColor: context.theme.primaryColor,
      ),
      body: Center(
        child: Text('Thông tin người dùng: ${widget.userEntity.fullName}'),
      ),
    );
  }
}
