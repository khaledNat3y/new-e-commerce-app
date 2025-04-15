import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_e_commerce_app/core/helpers/spacing.dart';
import 'package:new_e_commerce_app/core/routing/routes.dart';
import 'package:new_e_commerce_app/features/register_screen/ui/widgets/register_form.dart';
import '../../../../core/theming/app_theme.dart';
import '../../../login_screen/ui/widgets/end_screen_rich_text.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(49.h),
                      Text(
                        "Create an account",
                        style: AppTheme.font32BlackSemiBold.copyWith(
                          letterSpacing: -1.sp,
                          wordSpacing: -5.sp,
                        ),
                        maxLines: 2,
                      ),
                      verticalSpace(8.h),
                      Text(
                        "Let’s create your account.",
                        style: AppTheme.font16GreyRegular,
                        maxLines: 2,
                      ),
                      verticalSpace(24.h),
                      RegisterForm(),
                    ],
                  ),
                  Center(
                    child: EndScreenRichText(
                      title: "Already have an account? ",
                      subtitle: "Log In",
                      onTap: () {
                        GoRouter.of(context)
                            .pushReplacementNamed(Routes.loginScreen);
                      },
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
