import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/utils/media_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                  MediaUtils.imgBackground,
                  fit: BoxFit.cover,
                ),
                Text(
                  'Login',
                  style: TextStyleUtils.normal(),
                ),
              ],
            ),
            Center(
              child: BaseTextField(controller: TextEditingController(), hintText: 'Email'),
            ),
          ],
        ),
      ),
    );
  }
}
