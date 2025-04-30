import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_theme.dart';

class CategoryItemWidget extends StatelessWidget {
  final String categoryName;
  final VoidCallback? onTap;
  final bool isSelected;

  const CategoryItemWidget({
    super.key,
    required this.categoryName,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 8.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : AppColors.transparent,
            border: isSelected ? null : Border.all(
              color: AppColors.textFieldGreyColor,
              width: 0.5.w,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(categoryName, style: isSelected ? AppTheme.font16WhiteMedium : AppTheme.font16BlackMedium),
        ),
      ),
    );
  }
}
