import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_theme.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/primary_button_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key,});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("User Name", style: AppTheme.font16BlackMedium,),
          verticalSpace(8),
          CustomTextField(
            height: 52.h,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            hintText: "Enter your email address",
            hintStyle: AppTheme.font16GreyRegular.copyWith(
              color: AppColors.textFieldGreyColor,
            ),
            fillColor: AppColors.white,
          ),
          verticalSpace(16),
          Text("Password", style: AppTheme.font16BlackMedium,),
          verticalSpace(8),
          CustomTextField(
            height: 52.h,
            hintText: "Enter your password",
            hintStyle: AppTheme.font16GreyRegular.copyWith(
              color: AppColors.textFieldGreyColor,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            fillColor: AppColors.white,
            obscureText: isObscureText,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              icon:isObscureText
                  ? const Icon(
                Icons.visibility_off,
                color: AppColors.textFieldGreyColor,
              )
                  : const Icon(
                Icons.remove_red_eye,
                color: AppColors.textFieldGreyColor,
              ),
            ),
          ),
          verticalSpace(55),
          Padding(
            padding: EdgeInsets.only(left: 8.h, right: 16.w),
            child: PrimaryButtonWidget(
              buttonText: "Sign In",
              buttonTextStyle: AppTheme.font14WhiteMedium,
              onPress: () {},
            ),
          ),
        ],
      ),
    );
  }
}