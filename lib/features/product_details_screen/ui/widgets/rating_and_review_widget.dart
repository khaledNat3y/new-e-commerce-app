import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_theme.dart';

class RatingAndReviewWidget extends StatelessWidget {
  const RatingAndReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: AppColors.orange),
        horizontalSpace(4),
        Text("4.5", style: AppTheme.font16BlackRegular),
        horizontalSpace(8),
        Text("(12 reviews)", style: AppTheme.font16GreyMedium),
      ],
    );
  }
}
