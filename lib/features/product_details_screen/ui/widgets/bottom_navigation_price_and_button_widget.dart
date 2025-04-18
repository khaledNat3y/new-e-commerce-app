import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_theme.dart';
import '../../../../core/widgets/primary_button_widget.dart';

class BottomNavigationPriceAndButtonWidget extends StatelessWidget {
  const BottomNavigationPriceAndButtonWidget({super.key});

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
              Text(r"$1,190", style: AppTheme.font24BlackSemiBold),
            ],
          ),
          horizontalSpace(16),
          PrimaryButtonWidget(
            width: MediaQuery.sizeOf(context).width * 0.61538,
            buttonText: "Add to Cart",
            onPress: () {},
            enablePrefixIcon: true,
          ),
        ],
      ),
    );
  }
}
