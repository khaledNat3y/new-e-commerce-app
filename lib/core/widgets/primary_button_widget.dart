import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/helpers/spacing.dart';
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
  final bool enablePrefixIcon;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool enableSuffixIcon;
  final bool isLoading;

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
    this.enablePrefixIcon = false,
    this.prefixIcon,
    this.suffixIcon,
    this.enableSuffixIcon = false,
    this.isLoading = false,
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
      child:
          isLoading
              ? SizedBox(
                width: 30.w,
                height: 30.h,
                child: const Center(child: CircularProgressIndicator(color: AppColors.white,)),
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  enablePrefixIcon
                      ? prefixIcon ??
                          Icon(
                            Icons.shopping_bag_outlined,
                            color: textColor ?? AppColors.white,
                            size: 24,
                          )
                      : const SizedBox.shrink(),
                  enablePrefixIcon ? horizontalSpace(10) : const SizedBox.shrink(),
                  Text(
                    buttonText ?? "",
                    style: buttonTextStyle ?? AppTheme.font14WhiteSemiBold,
                  ),
                  enableSuffixIcon ? horizontalSpace(10) : const SizedBox.shrink(),
                  enableSuffixIcon
                      ? suffixIcon ??
                          Icon(
                            Icons.arrow_forward,
                            color: textColor ?? AppColors.white,
                            size: 24,
                          )
                      : const SizedBox.shrink(),
                ],
              ),
    );
  }
}
