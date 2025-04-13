import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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