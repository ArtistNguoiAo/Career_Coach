import 'package:career_coach/domain/entity/user_entity.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/media_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_avatar.dart';
import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key, required this.userEntity});

  final UserEntity? userEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200 + MediaQuery.of(context).padding.top,
      child: Stack(
        children: [
          Container(
            height: 150 + MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(MediaUtils.imgProfileBackground), fit: BoxFit.cover),
            ),
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).padding.top + 8),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha((0.3 * 255).round()),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.language.welcomeApp, style: TextStyleUtils.bold(fontSize: 20, color: Colors.white)),
                  const SizedBox(height: 4),
                  Text(
                    context.language.introduce,
                    style: TextStyleUtils.normal(fontSize: 16, color: context.theme.backgroundColor),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 100 + MediaQuery.of(context).padding.top,
            left: 16,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {},
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width - 32,
                decoration: BoxDecoration(
                  color: context.theme.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: context.theme.borderColor.withAlpha((0.5 * 255).round()),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseAvatar(url: userEntity?.avatar ?? '', size: 80, padding: 16),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              '${context.language.hello},',
                              style: TextStyleUtils.normal(fontSize: 16, color: context.theme.textColor),
                            ),
                          ),
                          if (userEntity != null && userEntity!.fullName.isNotEmpty) ...[
                            Flexible(
                              child: Text(
                                userEntity?.fullName ?? '',
                                style: TextStyleUtils.bold(fontSize: 20, color: context.theme.primaryColor),
                              ),
                            ),
                          ],
                          Flexible(
                            child: Text(
                              '${context.language.haveAGoodDay}!',
                              style: TextStyleUtils.normal(fontSize: 16, color: context.theme.textColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
