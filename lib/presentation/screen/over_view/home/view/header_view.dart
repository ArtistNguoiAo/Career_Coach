import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Container(
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              width: double.infinity,
              color: context.theme.primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          context.language.welcomeApp,
                          style: TextStyleUtils.bold(
                            fontSize: 20,
                            color: context.theme.backgroundColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      InkWell(
                        onTap: () {

                        },
                        child: Stack(
                          children: [
                            Icon(
                              IconlyBold.notification,
                              color: context.theme.backgroundColor,
                              size: 28,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    context.language.introduce,
                    style: TextStyleUtils.normal(
                      fontSize: 16,
                      color: context.theme.backgroundColor,
                    ),
                  ),
                ],
              )),
          Positioned(
            top: 100,
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
                    BaseAvatar(
                      url: '',
                      size: 80,
                      padding: 16,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              '${context.language.hello},',
                              style: TextStyleUtils.normal(
                                fontSize: 16,
                                color: context.theme.textColor,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Le Quoc Trung",
                              style: TextStyleUtils.bold(
                                fontSize: 20,
                                color: context.theme.primaryColor,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              '${context.language.haveAGoodDay}!',
                              style: TextStyleUtils.normal(
                                fontSize: 16,
                                color: context.theme.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    FaIcon(
                      FontAwesomeIcons.feather,
                      color: context.theme.textColor,
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
