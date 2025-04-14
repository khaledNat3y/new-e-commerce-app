import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_colors.dart';
import '../theming/app_theme.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String? buttonText;
  final TextStyle? buttonTextStyle;
  final Color? buttonColor;
  final void Function()? onPress;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? bordersRadius;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;

  const PrimaryButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPress,
    this.textColor,
    this.width,
    this.height,
    this.bordersRadius,
    this.buttonColor,
    this.fontSize,
    this.padding,
    this.buttonTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(bordersRadius ?? 8.r),
        ),
        padding: padding,
        fixedSize: Size(
          width ?? MediaQuery.sizeOf(context).width * 0.848717,
          height ?? MediaQuery.sizeOf(context).height * 0.06635,
        ),
      ),
      child: Text(
        buttonText ?? "",
        style: buttonTextStyle ?? AppTheme.font14WhiteSemiBold,
      ),
    );
  }
}
