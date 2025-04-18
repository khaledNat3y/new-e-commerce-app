import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_e_commerce_app/core/helpers/functions.dart';
import 'package:new_e_commerce_app/core/helpers/spacing.dart';
import 'package:new_e_commerce_app/generated/assets.dart';

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
                CustomListTileWidget(leadingAssetPath: Assets.imagesBox, title: "My Orders",),
                Divider(thickness: 8, color: AppColors.grey.withValues(alpha: 0.5)),
                CustomListTileWidget(leadingAssetPath: Assets.imagesDetails, title: "My Details",),
                CustomListTileWidget(leadingAssetPath: Assets.imagesAddress, title: "Address Book",),
                CustomListTileWidget(leadingAssetPath: Assets.imagesQuestion, title: "FAQs",),
                CustomListTileWidget(leadingAssetPath: Assets.imagesHeadPhone, title: "Help Center",),
                Divider(thickness: 8, color: AppColors.lightGrey),
              ],
            ),
          ),
          Expanded(child: GestureDetector(
            onTap: (){

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
}


