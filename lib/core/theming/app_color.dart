import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_e_commerce_app/core/theming/app_colors.dart';

class AppColor extends ThemeExtension<AppColor> {
  final Color primary;
  final Color secondary;

  AppColor({required this.primary, required this.secondary});

  @override
  AppColor copyWith({Color? primary, Color? secondary}) {
    return AppColor(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
    );
  }

  @override
  AppColor lerp(ThemeExtension<AppColor>? other, double t) {
    if (other is! AppColor) return this;
    return AppColor(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
    );
  }
}
