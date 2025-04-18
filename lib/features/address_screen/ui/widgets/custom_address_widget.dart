import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_theme.dart';

class CustomAddressWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String leadingAssetPath;
  final void Function()? onTap;
  const CustomAddressWidget({super.key, required this.title, required this.subtitle, required this.leadingAssetPath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey, width: 1.w,),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        title: Text(title, style: AppTheme.font16BlackMedium,),
        subtitle: Text(subtitle, style: AppTheme.font14GreyRegular, maxLines: 1, overflow: TextOverflow.ellipsis,),
        leading: Image.asset(leadingAssetPath, width: 24, height: 24,),
      ),
    );
  }
}
