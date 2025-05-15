
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/features/cart_screen/logic/cart_cubit.dart';
import 'package:new_e_commerce_app/features/home_screen/data/models/products_model.dart';

import '../../../../core/helpers/functions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_theme.dart';
import '../../../../core/widgets/primary_button_widget.dart';

class BottomNavigationPriceAndButtonWidget extends StatelessWidget {
  final ProductDatum product;
  const BottomNavigationPriceAndButtonWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.lightGrey,
            width: 1.w,
          ),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Price", style: AppTheme.font16GreyRegular),
              Text("\$ ${product.price}", style: AppTheme.font24BlackSemiBold),
            ],
          ),
          horizontalSpace(16),
          BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {
              if(state is SuccessAddingToCarts) {
                showAnimatedSnackDialog(
                  context, message: "Product added to cart successfully",
                  type: AnimatedSnackBarType.success,);
              }
              if(state is ErrorAddingToCarts) {
                showAnimatedSnackDialog(
                  context, message: state.error,
                  type: AnimatedSnackBarType.error,);
              }
            },
            builder: (context, state) {
              if (state is AddingToCart) {
                return PrimaryButtonWidget(
                  isLoading: true,
                  width: MediaQuery
                      .sizeOf(context)
                      .width * 0.61538,
                  buttonText: "Add to Cart",
                  onPress: () {},
                  enablePrefixIcon: true,
                );
              }
              return PrimaryButtonWidget(
                width: MediaQuery
                    .sizeOf(context)
                    .width * 0.61538,
                buttonText: "Add to Cart",
                enablePrefixIcon: true,
                onPress: () {
                  context.read<CartCubit>().addToCart(product: product, productId: product.id);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
