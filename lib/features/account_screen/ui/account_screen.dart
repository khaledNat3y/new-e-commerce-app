import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:new_e_commerce_app/core/di/dependency_injection.dart';
import 'package:new_e_commerce_app/core/helpers/functions.dart';
import 'package:new_e_commerce_app/core/helpers/spacing.dart';
import 'package:new_e_commerce_app/core/helpers/storage_helper.dart';
import 'package:new_e_commerce_app/generated/assets.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_theme.dart';
import '../../../core/widgets/custom_list_tile_widget.dart';

class AccountScreen extends StatelessWidget {
  final void Function(int) onBackButtonPressed;
  const AccountScreen({super.key, required this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                buildAppBar(context,"Account", onBackButtonPressed),
                verticalSpace(24),
                Divider(thickness: 1.w, color: AppColors.lightGrey),
                const CustomListTileWidget(leadingAssetPath: Assets.imagesBox, title: "My Orders",),
                Divider(thickness: 8, color: AppColors.grey.withValues(alpha: 0.5)),
                CustomListTileWidget(leadingAssetPath: Assets.imagesDetails, title: "My Details", onTap: (){},),
                CustomListTileWidget(leadingAssetPath: Assets.imagesAddress, title: "Address Book", onTap: (){
                  GoRouter.of(context).pushNamed(Routes.addressScreen);
                },),
                CustomListTileWidget(leadingAssetPath: Assets.imagesQuestion, title: "FAQs", onTap: (){},),
                CustomListTileWidget(leadingAssetPath: Assets.imagesHeadPhone, title: "Help Center", onTap: (){},),
                const Divider(thickness: 8, color: AppColors.lightGrey),
              ],
            ),
          ),
          Expanded(child: GestureDetector(
            onTap: () {
              showAlertDialog(context);
            },
            child: Row(
              children: [
                Image.asset(Assets.imagesLogOut, width: 24.w, height: 24.h,),
                horizontalSpace(16),
                Text("Logout", style: AppTheme.font16ErrorColorRegular,),
              ],
            ),
          ))
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      barrierColor: AppColors.transparent,
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.all(24),
      backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.svgsWarning, width: 70.w, height: 70.h,),
            verticalSpace(12),
            Text("Logout?", style: AppTheme.font20BlackSemiBold),
            verticalSpace(8),
            Text("Are you sure you want to logout?", style: AppTheme.font16GreyRegular,),
            verticalSpace(24),
            ElevatedButton(onPressed: ()async{
              GoRouter.of(context).pushReplacementNamed(Routes.loginScreen);
              await getIt<StorageHelper>().clearToken();
            }, style: ElevatedButton.styleFrom(
              surfaceTintColor: AppColors.white,
              backgroundColor: AppColors.errorColor,
              elevation: 0,
              minimumSize: Size(double.infinity, 54.h),
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
            ), child: Text("Yes, Logout", style: AppTheme.font16WhiteMedium,),),
            verticalSpace(12),
            ElevatedButton(onPressed: (){
              context.pop();
            }, style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              minimumSize: Size(double.infinity, 54.h),
              surfaceTintColor: AppColors.white,
              elevation: 0,
              side: BorderSide(color: AppColors.lightGrey, width: 1.w),
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
            ), child: Text("No, Cancel", style: AppTheme.font16BlackMedium,),),
          ],
        ),
      ),
    );
  }
}


