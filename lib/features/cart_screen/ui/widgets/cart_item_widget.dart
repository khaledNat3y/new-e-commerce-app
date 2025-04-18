import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_theme.dart';
import '../../../../generated/assets.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey, width: 1.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              width: 72.w,
              height: 72.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesTshirt),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Regular Fit Slogan", style: AppTheme.font16BlackRegular),
              verticalSpace(4.h),
              Text("Size: M", style: AppTheme.font16GreyRegular),
              verticalSpace(18.h),
              Text("\$1,190", style: AppTheme.font16BlackSemiBold),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete_outline_rounded, color: AppColors.errorColor, size: 24.sp,),
              ),
              verticalSpace(16),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightGrey, width: 1.w),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.remove,
                      color: AppColors.primaryColor,
                      size: 24.sp,
                    ),
                  ),
                  horizontalSpace(9),
                  Text("1", style: AppTheme.font16BlackRegular),
                  horizontalSpace(9),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightGrey, width: 1.w),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.remove,
                      color: AppColors.primaryColor,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
