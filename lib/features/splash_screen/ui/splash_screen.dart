import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_e_commerce_app/core/helpers/extensions.dart';
import 'package:new_e_commerce_app/core/routing/routes.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/storage_helper.dart';
import '../../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    );
    waitAnimationAndNavigate();
  }

  Future<void> waitAnimationAndNavigate() async {
    const duration = Duration(seconds: 1, milliseconds: 500 );
    await Future.delayed(duration);
      final String? userToken =
      await getIt<StorageHelper>().getToken();
      if (!userToken.isNullOrEmpty()) {
        // isLoggedInUser = true;
        context.goNamed(Routes.mainScreen);
      } else {
        // isLoggedInUser = false;
        context.goNamed(Routes.loginScreen);
      }

  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.asset(
            Assets.imagesSplashScreenImage,
            width: 150.w,
            height: 150.h,
          ),
        ),
      ),
    );
  }
}
