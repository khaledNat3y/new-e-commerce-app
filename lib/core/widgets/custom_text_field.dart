import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/font_weight_helper.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? width;
  final bool? obscureText;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final Color? fillColor;
  final int? maxLines;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.width,
    this.obscureText,
    this.inputType,
    this.validator,
    this.controller,
    this.fillColor,
    this.maxLines,
    this.height,
    this.onChanged,
    this.onFieldSubmitted,
    this.hintStyle, this.contentPadding, this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 331.w,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: AppColors.primaryColor,
        cursorErrorColor: AppColors.errorColor,
        obscureText: obscureText ?? false,
        keyboardType: inputType,
        validator: validator,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          isDense: true,
          disabledBorder: InputBorder.none,
          hintText: hintText ?? "",
          hintStyle: hintStyle ?? TextStyle(
            fontSize: 15.sp,
            color: AppColors.black,
            fontWeight: FontWeightHelper.medium,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          contentPadding: contentPadding ??  EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 18.h,
          ),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          errorBorder: buildOutlineInputBorder(color: AppColors.errorColor),
          focusedErrorBorder: buildOutlineInputBorder(
            color: AppColors.errorColor,
          ),
          filled: true,
          fillColor: fillColor ?? const Color(0xffF7F8F9),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: color ?? AppColors.e6White, width: 1.w),
    );
  }
}
