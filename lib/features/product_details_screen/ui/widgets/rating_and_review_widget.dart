import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_theme.dart';

class RatingAndReviewWidget extends StatelessWidget {
  final double? rating;
  final int? count;
  const RatingAndReviewWidget({super.key, this.rating, this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: AppColors.orange),
        horizontalSpace(4),
        Text(rating.toString(), style: AppTheme.font16BlackRegular),
        horizontalSpace(8),
        Text("(${count}reviews)", style: AppTheme.font16GreyMedium),
      ],
    );
  }
}
