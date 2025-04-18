import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/app_theme.dart';

class CustomListTileWidget extends StatelessWidget {
  final String title;
  final String leadingAssetPath;
  final bool? enableBottomBorder;
  const CustomListTileWidget({
    super.key,
    required this.title,
    required this.leadingAssetPath, this.enableBottomBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(bottom: 12.h),
      shape: enableBottomBorder == true ? const Border(bottom: BorderSide(color: AppColors.lightGrey, width: 1)) : null,
      leading: Image.asset(leadingAssetPath, width: 24, height: 24),
      title: Text(title, style: AppTheme.font16BlackRegular),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.textFieldGreyColor,
          size: 24,
        ),
      ),
    );
  }
}
