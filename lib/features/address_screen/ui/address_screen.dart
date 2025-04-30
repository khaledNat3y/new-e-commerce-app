import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/helpers/spacing.dart';
import 'package:new_e_commerce_app/features/address_screen/ui/widgets/custom_address_widget.dart';
import 'package:new_e_commerce_app/generated/assets.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_theme.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(24),
              Divider(thickness: 1.w, color: AppColors.lightGrey,),
              verticalSpace(20),
              Text("Saved Address", style: AppTheme.font16BlackSemiBold,),
              verticalSpace(16),
              const CustomAddressWidget(title: "Home", subtitle: "925 S Chugach St #APT 10, Alas...", leadingAssetPath: Assets.imagesLocation,),
              verticalSpace(12),
              const CustomAddressWidget(title: "Office", subtitle: "2438 6th Ave, Ketchikan, Alaska 99901, USA", leadingAssetPath: Assets.imagesLocation,),
              verticalSpace(12),
              const CustomAddressWidget(title: "Apartment", subtitle: "2551 Vista Dr #B301, Juneau, Alaska 99801, USA", leadingAssetPath: Assets.imagesLocation,),
              verticalSpace(12),
              const CustomAddressWidget(title: "Parent’s House", subtitle: "4821 Ridge Top Cir, Anchorage, Alaska 99508, USA", leadingAssetPath: Assets.imagesLocation,),
              verticalSpace(12),



            ],
          ),
      ),
    );
  }
}


