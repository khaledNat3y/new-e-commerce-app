import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/helpers/spacing.dart';
import 'package:new_e_commerce_app/core/widgets/loading_widget.dart';
import 'package:new_e_commerce_app/core/widgets/primary_button_widget.dart';
import 'package:new_e_commerce_app/features/cart_screen/logic/cart_cubit.dart';
import 'package:new_e_commerce_app/features/cart_screen/ui/widgets/cart_item_widget.dart';
import '../../../core/helpers/functions.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_theme.dart';

class CartScreen extends StatelessWidget {
  final void Function(int) onBackButtonPressed;

  const CartScreen({super.key, required this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listenWhen:
          (previous, current) =>
              current is RemovingFromCartSuccess ||
              current is RemovingFromCartFailure ||
              current is ClearAllInCart,
      listener: (context, state) {
        if (state is RemovingFromCartSuccess) {
          showAnimatedSnackDialog(
            context,
            message: "Product removed from cart successfully",
            type: AnimatedSnackBarType.success,
          );
        } else if (state is RemovingFromCartFailure) {
          showAnimatedSnackDialog(
            context,
            message: state.error,
            type: AnimatedSnackBarType.error,
          );
        } else if (state is ClearAllInCart) {
          showAnimatedSnackDialog(
            context,
            message: "Cart cleared successfully",
            type: AnimatedSnackBarType.success,
          );
        }
      },
      child: SingleChildScrollView(
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartsLoading || state is RemovingFromCartLoading) {
              return Center(
                child: LoadingWidget(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                ),
              );
            }
            if (state is SuccessGettingCarts) {
              if (state.cartModel.data?.products == null ||
                  state.cartModel.data!.products!.isEmpty) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    children: [
                      buildAppBar(context, "My Cart", onBackButtonPressed),
                      verticalSpace(40),
                      Text(
                        "Your cart is empty",
                        style: AppTheme.font16BlackMedium,
                      ),
                    ],
                  ),
                );
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Column(
                  children: [
                    buildAppBar(context, "My Cart", onBackButtonPressed),
                    verticalSpace(20),
                    ListView.builder(
                      itemCount: state.cartModel.data?.products?.length ?? 0,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CartItemWidget(
                          productElement:
                              state.cartModel.data!.products![index],
                          onRemove: () {
                            context
                                .read<CartCubit>()
                                .removeSpecificItemFromCart(
                                  productId:
                                      state
                                          .cartModel
                                          .data!
                                          .products![index]
                                          .product!
                                          .id ??
                                      "",
                                );
                          },
                        );
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(right: 4.w),
                      title: Text(
                        "Sub-total",
                        style: AppTheme.font16GreyRegular,
                      ),
                      trailing: Text(
                        "\$ ${state.cartModel.data?.totalCartPrice}",
                        style: AppTheme.font16BlackMedium,
                      ),
                    ),
                    verticalSpace(8),
                    ListTile(
                      contentPadding: EdgeInsets.only(right: 4.w),
                      title: Text("VAT (%)", style: AppTheme.font16GreyRegular),
                      trailing: Text(
                        "\$ 0.00",
                        style: AppTheme.font16BlackMedium,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(right: 4.w),
                      title: Text(
                        "Shipping fee",
                        style: AppTheme.font16GreyRegular,
                      ),
                      trailing: Text(
                        "\$ 0.00",
                        style: AppTheme.font16BlackMedium,
                      ),
                    ),
                    Divider(thickness: 1.w, color: AppColors.lightGrey),
                    ListTile(
                      contentPadding: EdgeInsets.only(right: 4.w),
                      title: Text("Total", style: AppTheme.font16BlackMedium),
                      trailing: Text(
                        "\$ ${state.cartModel.data?.totalCartPrice}",
                        style: AppTheme.font16BlackMedium,
                      ),
                    ),
                    verticalSpace(40),
                    PrimaryButtonWidget(
                      buttonText: "Go To Checkout",
                      onPress: () {},
                      enableSuffixIcon: true,
                    ),
                    verticalSpace(18),
                    PrimaryButtonWidget(
                      buttonText: "Clear Cart",
                      buttonColor: AppColors.errorColor,
                      onPress: () {
                        context.read<CartCubit>().clearCart();
                      },
                      enableSuffixIcon: true,
                    ),
                    verticalSpace(18),
                  ],
                ),
              );
            }

            // Handle other states to prevent white screen
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildAppBar(context, "My Cart", onBackButtonPressed),
                  verticalSpace(20),
                  LoadingWidget(
                    height: 200.h,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
