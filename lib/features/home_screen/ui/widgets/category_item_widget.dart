import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_theme.dart';

class CategoryItemWidget extends StatelessWidget {
  final String categoryName;

  const CategoryItemWidget({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 8.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.textFieldGreyColor, width: 0.5.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(categoryName, style: AppTheme.font16BlackMedium,),
      ),
    );
  }
}
