import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_theme.dart';

class ProductItemWidget extends StatelessWidget {
  final String title;
  final double price;
  const ProductItemWidget({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            width: double.infinity,
            height: 150.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                    image: AssetImage("assets/images/image.png"),
                    fit: BoxFit.fill
                )
            ),
          ),
        ),
        verticalSpace(8),
        Text(title, style: AppTheme.font16BlackSemiBold,),
        verticalSpace(4),
        Text("\$$price", style: AppTheme.font12GreyMedium,)
      ],
    );
  }
}
