import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/helpers/spacing.dart';
import 'package:new_e_commerce_app/core/theming/app_theme.dart';
import 'package:new_e_commerce_app/core/widgets/primary_button_widget.dart';
import '../../../../core/theming/app_colors.dart';
import 'login_form.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(49),
          Text(
            "Login to your account",
            style: AppTheme.font32BlackSemiBold.copyWith(
              letterSpacing: -1.sp,
              wordSpacing: -5.sp,
            ),
            maxLines: 2,
          ),
          verticalSpace(8),
          Text(
            "It’s great to see you again.",
            style: AppTheme.font16GreyRegular,
            maxLines: 2,
          ),
          verticalSpace(24),
          LoginForm(),

          Spacer(),
          Center(
            child: EndScreenRichText(
              title: "Don’t have an account? ",
              subtitle: "Join",
              onTap: (){},
            ),
          ),
        ],
      ),
    );
  }
}

class EndScreenRichText extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() onTap;

  const EndScreenRichText({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: title,
        style: AppTheme.font16GreyRegular,
        children: [
          TextSpan(
            text: subtitle,
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style: AppTheme.font14BlackRegular.copyWith(
              color: AppColors.anotherBlackType,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.anotherBlackType,
            ),
          ),
        ],
      ),
    );
  }
}
