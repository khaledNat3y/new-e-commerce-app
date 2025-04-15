import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_theme.dart';

class EndScreenRichText extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() onTap;

  const EndScreenRichText({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: title,
        style: AppTheme.font16GreyRegular,
        children: [
          TextSpan(
            text: subtitle,
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style: AppTheme.font16BlackRegular.copyWith(
              color: AppColors.anotherBlackType,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.anotherBlackType,
            ),
          ),
        ],
      ),
    );
  }
}
