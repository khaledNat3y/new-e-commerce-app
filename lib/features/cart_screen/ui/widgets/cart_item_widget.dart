import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/features/cart_screen/data/models/get_user_cart_model.dart';
import 'package:new_e_commerce_app/features/cart_screen/logic/cart_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_theme.dart';

class CartItemWidget extends StatefulWidget {
  final ProductElement productElement;
  final void Function()? onRemove;

  const CartItemWidget({super.key, required this.productElement, this.onRemove});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  late int counter;
  bool _isDeleting = false;

  @override
  void initState() {
    super.initState();
    // Initialize counter with the product count from the model
    counter = widget.productElement.count ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    return _isDeleting
        ? Container(
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey, width: 1.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    )
        : Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey, width: 1.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              width: 72.w,
              height: 72.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.productElement.product?.imageCover ?? "",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          horizontalSpace(8.w),
          // Product Details - Make this Expanded to handle long text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.productElement.product?.title}",
                  style: AppTheme.font16BlackRegular,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2, // Allow up to 2 lines for the title
                ),
                verticalSpace(4.h),
                Text("Size: M", style: AppTheme.font16GreyRegular),
                verticalSpace(18.h),
                Text(
                  "\$${widget.productElement.price}",
                  style: AppTheme.font16BlackSemiBold,
                ),
              ],
            ),
          ),
          horizontalSpace(8.w),
          // Actions Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: widget.onRemove,
                icon: Icon(
                  Icons.delete_outline_rounded,
                  color: AppColors.errorColor,
                  size: 24.sp,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              verticalSpace(16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (counter > 1) {
                          counter--;
                          // TODO: Implement API call to update quantity
                          // context.read<CartCubit>().updateCartItemQuantity(
                          //   productId: widget.productElement.product!.id,
                          //   count: counter
                          // );
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.lightGrey,
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: AppColors.primaryColor,
                        size: 24.sp,
                      ),
                    ),
                  ),
                  horizontalSpace(8),
                  Text("$counter", style: AppTheme.font16BlackRegular),
                  horizontalSpace(8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                        // TODO: Implement API call to update quantity
                        // context.read<CartCubit>().updateCartItemQuantity(
                        //   productId: widget.productElement.product!.id,
                        //   count: counter
                        // );
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.lightGrey,
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColors.primaryColor,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}