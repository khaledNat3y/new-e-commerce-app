import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/helpers/spacing.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theming/app_colors.dart';
import '../theming/app_theme.dart';

/// Truncate a string to a maximum number of words
String truncateToFirstNWords(String inputString, int wordLimit) {
  final List<String> words = inputString.split(' ');
  if (words.length <= wordLimit) {
    return inputString;
  }
  return words.sublist(0, wordLimit).join(' ');
}

Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}

Row buildAppBar(
  BuildContext context,
  String title, [
  void Function(int)? onBackButtonPressed,
    ]) {
  const int currentIndex = 0;
  return Row(
    children: [
      IconButton(
        onPressed: () {
          if (onBackButtonPressed != null) onBackButtonPressed(currentIndex);
        },
        icon: const Icon(Icons.arrow_back, color: AppColors.black),
        iconSize: 24,
      ),
      horizontalSpace(MediaQuery.sizeOf(context).width * 0.2),
      Text(title, style: AppTheme.font24BlackSemiBold),
    ],
  );
}

void showAnimatedSnackDialog(
  BuildContext context, {
  String? message,
  AnimatedSnackBarType? type,
}) {
  AnimatedSnackBar.material(
    message ?? "Product added to cart successfully",
    type: type ?? AnimatedSnackBarType.success,
    duration: const Duration(seconds: 5),
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
  ).show(context);
}

Shimmer buildShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Container(
      color: Colors.white,
      width: double.infinity,
      height: 150.h,
    ),
  );
}
