import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/helpers/spacing.dart';
import 'package:new_e_commerce_app/core/widgets/primary_button_widget.dart';
import 'package:new_e_commerce_app/features/cart_screen/ui/widgets/cart_item_widget.dart';
import '../../../core/helpers/functions.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_theme.dart';

class CartScreen extends StatelessWidget {
  final void Function(int) onBackButtonPressed;
  const CartScreen({super.key, required this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          children: [
            buildAppBar(context,"My Cart", onBackButtonPressed),
            verticalSpace(20),
            CartItemWidget(),
            ListTile(
              contentPadding: EdgeInsets.only(right: 4.w),
              title: Text("Sub-total", style: AppTheme.font16GreyRegular),
              trailing: Text("\$ 5,870", style: AppTheme.font16BlackMedium),
            ),
            verticalSpace(8),
            ListTile(
              contentPadding: EdgeInsets.only(right: 4.w),
              title: Text("VAT (%)", style: AppTheme.font16GreyRegular),
              trailing: Text("\$ 0.00", style: AppTheme.font16BlackMedium),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(right: 4.w),
              title: Text("Shipping fee", style: AppTheme.font16GreyRegular),
              trailing: Text("\$ 80", style: AppTheme.font16BlackMedium),
            ),
            Divider(thickness: 1.w, color: AppColors.lightGrey),
            ListTile(
              contentPadding: EdgeInsets.only(right: 4.w),
              title: Text("Total", style: AppTheme.font16BlackMedium),
              trailing: Text("\$ 6,650", style: AppTheme.font16BlackMedium),
            ),
            verticalSpace(40),
            PrimaryButtonWidget(buttonText: "Go To Checkout", onPress: () {}, enableSuffixIcon: true,),
            verticalSpace(18),
          ],
        ),
      ),
    );
  }
}
