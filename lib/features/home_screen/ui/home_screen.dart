import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/helpers/spacing.dart';
import 'package:new_e_commerce_app/core/theming/app_theme.dart';
import 'package:new_e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:new_e_commerce_app/features/home_screen/ui/widgets/category_item_widget.dart';
import 'package:new_e_commerce_app/features/home_screen/ui/widgets/product_grid_view.dart';

import '../../../core/theming/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(28),
        Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Text("Discover", style: AppTheme.font32BlackSemiBold),
        ),
        verticalSpace(16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            children: [
              CustomTextField(
                width: 281.w,
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.textFieldGreyColor,
                  size: 30,
                ),
                hintText: "Search for clothes...",
                hintStyle: AppTheme.font16GreyRegular,
              ),
              horizontalSpace(8),
              Container(
                width: 52.w,
                height: 52.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.tune_outlined, color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
        verticalSpace(16),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 24.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryItemWidget(categoryName: "All"),
                CategoryItemWidget(categoryName: "All"),
                CategoryItemWidget(categoryName: "All"),
                CategoryItemWidget(categoryName: "All"),
                CategoryItemWidget(categoryName: "All"),
                CategoryItemWidget(categoryName: "All"),
              ],
            ),
          ),
        ),
        verticalSpace(16),
        ProductsGridView(),
      ],
    );
  }
}

