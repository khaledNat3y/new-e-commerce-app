import 'package:flutter/material.dart';
import '../helpers/constants.dart';
import 'app_colors.dart';

abstract class AppThemeData {
  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: AppColors.primaryColor,
      elevation: 0,
      centerTitle: false,
    ),
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primaryColor,
    fontFamily: AppFonts.primaryFont,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryColor, // Change cursor color
      selectionColor: AppColors.primaryColor.withValues(alpha: 0.5), // Change selection highlight color
      selectionHandleColor: AppColors.primaryColor, // Change the color of selection handles (balls)
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.secondaryColor,
      disabledColor: AppColors.secondaryColor.withValues(alpha: 0.5),
    )
  );


  static final darkTheme = ThemeData();
}