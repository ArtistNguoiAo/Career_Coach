import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/media_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseAvatar extends StatelessWidget {
  const BaseAvatar({
    super.key,
    required this.url,
    required this.size,
    this.padding,
    this.onTap,
  });

  final String url;
  final double size;
  final double? padding;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.theme.borderColor.withAlpha((255 * 0.3).round()),
        ),
        child: url.isNotEmpty
            ? ClipOval(
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            )
            : Padding(
              padding: EdgeInsets.all(padding ?? 8.0),
              child: SvgPicture.asset(
                MediaUtils.icAvatarDefault,
                fit: BoxFit.cover,
              ),
            )
      ),
    );
  }
}