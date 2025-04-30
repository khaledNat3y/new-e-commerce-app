import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../generated/assets.dart';

class LoadingWidget extends StatelessWidget {
  final double? width;
  final double? height;

  const LoadingWidget({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.sizeOf(context).width * 0.5,
      height: height ?? MediaQuery.sizeOf(context).height * 0.5,
      child: Center(
        child: Lottie.asset(
          Assets.lottieLoadingAnimation,
          width: 150.w,
          height: 150.h,
        ),
      ),
    );
  }
}
