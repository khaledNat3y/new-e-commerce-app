import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/helpers/spacing.dart';
import 'package:new_e_commerce_app/core/theming/app_colors.dart';
import 'package:new_e_commerce_app/features/home_screen/data/models/products_model.dart';
import 'package:new_e_commerce_app/features/product_details_screen/ui/widgets/bottom_navigation_price_and_button_widget.dart';
import 'package:new_e_commerce_app/features/product_details_screen/ui/widgets/rating_and_review_widget.dart';
import '../../../core/theming/app_color.dart';
import '../../../core/theming/app_theme.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductDatum product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
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
                child: Hero(
                  tag: "product${product.id}",
                  child: CachedNetworkImage(
                    imageUrl: product.imageCover ?? "",
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const CircularProgressIndicator(color: AppColors.primaryColor,),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              verticalSpace(12),
              Text(product.title ?? "", style: AppTheme.font24BlackSemiBold),
              verticalSpace(13),
              RatingAndReviewWidget(rating: product.ratingsAverage , count: product.quantity,),
              verticalSpace(13),
              Text(
                product.description ?? "",
                style: AppTheme.font16GreyRegular,
              ),
              verticalSpace(5),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationPriceAndButtonWidget(product: product,),

    );
  }
}
