import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _header(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _basicProfile(
                  title: context.language.workExperience,
                  values: [],
                ),
                const SizedBox(height: 8),
                _basicProfile(
                  title: context.language.professionalPosition,
                  values: ['Flutter Developer', 'Mobile Developer'],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.theme.backgroundColor
            ),
            child: BaseAvatar(
              url: '',
              size: 100,
              padding: 16,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Le Quoc Trung',
                        style: TextStyleUtils.bold(
                          fontSize: 18,
                          color: context.theme.backgroundColor,
                        )
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: Icon(
                        FontAwesomeIcons.penToSquare,
                        color: context.theme.backgroundColor,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.userLarge,
                      color: context.theme.backgroundColor,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'toanquen13@gmail.com',
                      style: TextStyleUtils.normal(
                        color: context.theme.backgroundColor,
                      )
                    ),
                  ],
                ),
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.phone,
                      color: context.theme.backgroundColor,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '0333982632',
                      style: TextStyleUtils.normal(
                        color: context.theme.backgroundColor,
                      )
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: context.theme.typeAccountColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'Tai khoan thuong',
                    style: TextStyleUtils.normal(
                      color: context.theme.textColor,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _basicProfile({
    required String title,
    required List<String> values,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyleUtils.bold(
                  fontSize: 16,
                  color: context.theme.textColor,
                ),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Text(
                context.language.edit,
                style: TextStyleUtils.bold(
                  fontSize: 16,
                  color: context.theme.primaryColor,
                ),
              ),
            )
          ],
        ),
        if(values.isEmpty)...[
          Text(
            context.language.notUpdate,
            style: TextStyleUtils.normal(
              fontSize: 16,
              color: context.theme.textColor,
            ),
          ),
        ]
        else ...[
          ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: context.theme.primaryColor.withAlpha((255 * 0.1).round()),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  values[index],
                  style: TextStyleUtils.normal(
                    fontSize: 16,
                    color: context.theme.primaryColor,
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: 4),
            itemCount: values.length,
          )
        ]
      ],
    );
  }
}
