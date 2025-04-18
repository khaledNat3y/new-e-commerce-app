import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/constants.dart';
import 'app_colors.dart';
import 'font_weight_helper.dart';

abstract class AppTheme {
  static TextStyle font32BlackSemiBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.anotherBlackType,

  );

  static TextStyle font14WhiteRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.white,
  );

  static TextStyle font14BlackSemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.black,
  );

  static TextStyle font18BlackSemiBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.black,
  );

  static TextStyle font16BlackMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.black,
  );

  static TextStyle font12BlackMedium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.black,
  );

  static TextStyle font14BlackRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.black,
  );

  static TextStyle font14BlackMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.black,
  );

  static TextStyle font14GreyRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.grey,
  );

  static TextStyle font14lightBrownRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.lightBrown,
  );

  static TextStyle font24BlackRegular = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.black,
  );
  static TextStyle font16BlackRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.black,
  );
  static TextStyle font16GreyRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.textFieldGreyColor,
  );
  static TextStyle font16GreyMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.textFieldGreyColor,
  );

  static TextStyle font14WhiteSemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.white,
  );

  static TextStyle font14WhiteMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.white,
  );

  static TextStyle font12GreyMedium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.textFieldGreyColor,
  );

  static TextStyle font16BlackSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.black,
  );

  static TextStyle font24BlackSemiBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.anotherBlackType,
  );

  static TextStyle font16ErrorColorRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppFonts.primaryFont,
    color: AppColors.errorColor,
  );
}
