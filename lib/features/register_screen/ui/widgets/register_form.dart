import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_e_commerce_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:new_e_commerce_app/core/helpers/safe_tap.dart';

import '../../../../core/helpers/functions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_theme.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/primary_button_widget.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isObscureText = true;
  final formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showAnimatedSnackDialog(
            context,
            message: state.errorMessage,
            type: AnimatedSnackBarType.error,
          );
        }
        if (state is AuthRegisterSuccess) {
          showAnimatedSnackDialog(
            context,
            message: "Success",
            type: AnimatedSnackBarType.success,
          );
          GoRouter.of(context).pushNamed(Routes.loginScreen);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: LoadingWidget());
        }
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Full Name", style: AppTheme.font16BlackMedium),
              verticalSpace(8),
              CustomTextField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                height: 52.h,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 15.h,
                ),
                hintText: "Enter your full name",
                hintStyle: AppTheme.font16GreyRegular.copyWith(
                  color: AppColors.textFieldGreyColor,
                ),
                fillColor: AppColors.white,
              ),
              verticalSpace(16),
              Text("Email", style: AppTheme.font16BlackMedium),
              verticalSpace(8),
              CustomTextField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                height: 52.h,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 15.h,
                ),
                hintText: "Enter your email address",
                hintStyle: AppTheme.font16GreyRegular.copyWith(
                  color: AppColors.textFieldGreyColor,
                ),
                fillColor: AppColors.white,
              ),
              verticalSpace(16),
              Text("Password", style: AppTheme.font16BlackMedium),
              verticalSpace(8),
              CustomTextField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                height: 52.h,
                hintText: "Enter your password",
                hintStyle: AppTheme.font16GreyRegular.copyWith(
                  color: AppColors.textFieldGreyColor,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 15.h,
                ),
                fillColor: AppColors.white,
                obscureText: isObscureText,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  icon:
                      isObscureText
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
              verticalSpace(16),
              Text("Confirm Password", style: AppTheme.font16BlackMedium),
              verticalSpace(8),
              CustomTextField(
                controller: confirmPasswordController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value != passwordController.text) {
                    return 'Password does not match';
                  }
                  return null;
                },
                hintText: "Confirm your password",
                hintStyle: AppTheme.font16GreyRegular.copyWith(
                  color: AppColors.textFieldGreyColor,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 15.h,
                ),
                fillColor: AppColors.white,
                obscureText: isObscureText,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  icon:
                      isObscureText
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
              verticalSpace(16),
              Text("Phone", style: AppTheme.font16BlackMedium),
              verticalSpace(8),
              CustomTextField(
                controller: phoneController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if(value.length < 11) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
                hintText: "Phone number",
                hintStyle: AppTheme.font16GreyRegular.copyWith(
                  color: AppColors.textFieldGreyColor,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 15.h,
                ),
                fillColor: AppColors.white,
              ),
              verticalSpace(55),
              Padding(
                padding: EdgeInsets.only(left: 8.h, right: 16.w),
                child: PrimaryButtonWidget(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.5.w,
                    vertical: 15.h,
                  ),
                  buttonText: "Create Account",
                  buttonTextStyle: AppTheme.font14WhiteMedium,
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      SafeOnTap.execute(context: context, onTap: () async {
                        context.read<AuthCubit>().register(
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                          confirmPasswordController.text,
                          phoneController.text,
                        );
                      }, onNoConnection: () {
                        showAnimatedSnackDialog(context, message: "No internet connection! Please reconnect and try again!", type: AnimatedSnackBarType.warning,);
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
