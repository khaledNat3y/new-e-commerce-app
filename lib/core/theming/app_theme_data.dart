import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract class AppThemeData {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
        textTheme: GoogleFonts.readexProTextTheme(
          Theme.of(context).textTheme,
        ),
        fontFamily: "Readex Pro",
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.anotherBlackType,
          elevation: 0,
          centerTitle: false,
          surfaceTintColor: AppColors.white,
        ),
        scaffoldBackgroundColor: AppColors.white,
        primaryColor: AppColors.primaryColor,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.primaryColor, // Change cursor color
          selectionColor: AppColors.primaryColor.withValues(alpha: 0.5), // Change selection highlight color
          selectionHandleColor: AppColors.primaryColor, // Change the color of selection handles (balls)
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.primaryColor,
          disabledColor: AppColors.secondaryColor.withValues(alpha: 0.5),
        )
    );
  }


  static final darkTheme = ThemeData();
}