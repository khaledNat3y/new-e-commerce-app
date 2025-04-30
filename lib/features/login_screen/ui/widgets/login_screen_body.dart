import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_e_commerce_app/core/helpers/spacing.dart';
import 'package:new_e_commerce_app/core/routing/routes.dart';
import 'package:new_e_commerce_app/core/theming/app_theme.dart';
import 'end_screen_rich_text.dart';
import 'login_form.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
            const LoginForm(),
            verticalSpace(290),
            Center(
              child: EndScreenRichText(
                title: "Don’t have an account? ",
                subtitle: "Join",
                onTap: () {
                  GoRouter.of(context).pushNamed(Routes.registerScreen);
                },
              ),
            ),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
