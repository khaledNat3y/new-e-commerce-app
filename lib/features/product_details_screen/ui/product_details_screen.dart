import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/helpers/spacing.dart';
import 'package:new_e_commerce_app/core/theming/app_colors.dart';
import 'package:new_e_commerce_app/core/widgets/primary_button_widget.dart';
import 'package:new_e_commerce_app/features/product_details_screen/ui/widgets/bottom_navigation_price_and_button_widget.dart';
import 'package:new_e_commerce_app/features/product_details_screen/ui/widgets/rating_and_review_widget.dart';

import '../../../core/theming/app_theme.dart';
import '../../../generated/assets.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        surfaceTintColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Container(
                  width: 341.w,
                  height: 369.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.imagesTshirt),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              verticalSpace(12),
              Text("Fit Polo T-Shirt", style: AppTheme.font24BlackSemiBold),
              verticalSpace(13),
              RatingAndReviewWidget(),
              verticalSpace(13),
              Text(
                "Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them",
                style: AppTheme.font16GreyRegular,
              ),
              verticalSpace(5),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationPriceAndButtonWidget(),

    );
  }
}
