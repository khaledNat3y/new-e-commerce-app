import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_e_commerce_app/core/helpers/spacing.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theming/app_colors.dart';
import '../theming/app_theme.dart';

/// Truncate a string to a maximum number of words
String truncateToFirstNWords(String inputString, int wordLimit) {
  List<String> words = inputString.split(' ');
  if (words.length <= wordLimit) {
    return inputString;
  }
  return words.sublist(0, wordLimit).join(' ');
}


Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.platformDefault);
  } else {
    throw 'Could not launch $url';
  }
}


Row buildAppBar(BuildContext context, String title, [void Function(int)? onBackButtonPressed]) {
  const int currentIndex = 0;
  return Row(
    children: [
      IconButton(
        onPressed: () {
          if(onBackButtonPressed != null) onBackButtonPressed(currentIndex);
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.black,
        ),
        iconSize: 24,
      ),
      horizontalSpace(MediaQuery.sizeOf(context).width * 0.2),
      Text(title, style: AppTheme.font24BlackSemiBold),
    ],
  );
}
