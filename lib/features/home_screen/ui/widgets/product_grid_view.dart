import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:new_e_commerce_app/core/routing/routes.dart';
import 'package:new_e_commerce_app/core/theming/app_colors.dart';
import 'package:new_e_commerce_app/features/home_screen/data/models/products_model.dart';
import 'package:new_e_commerce_app/features/home_screen/logic/product_cubit.dart';
import 'package:new_e_commerce_app/features/home_screen/ui/widgets/product_item_widget.dart';

class ProductsGridView extends StatefulWidget {
  final ProductsModel products;
  final ValueChanged<String> selectedCategory;

  const ProductsGridView({
    super.key,
    required this.products,
    required this.selectedCategory,
  });

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        color: AppColors.primaryColor,
        backgroundColor: AppColors.white,
        onRefresh: () async {
          widget.selectedCategory("All");
          context.read<ProductCubit>().getProducts();
        },
        child: AnimationLimiter(
          child: GridView.builder(
            itemCount: widget.products.data.length,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.sp,
              mainAxisSpacing: 16.sp,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                columnCount: 2,
                duration: const Duration(milliseconds: 600),
                child: SlideAnimation(
                  verticalOffset: 200.0,
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap:
                          () => context.pushNamed(
                        Routes.productDetailsScreen,
                        extra: widget.products.data[index],
                      ),
                      child: ProductItemWidget(
                        id: widget.products.data[index].id,
                        title: widget.products.data[index].title,
                        price: widget.products.data[index].price,
                        imageUrl: widget.products.data[index].imageCover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}