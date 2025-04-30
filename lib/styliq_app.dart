import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/routing/app_router.dart';
import 'package:new_e_commerce_app/core/theming/app_theme_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: AppRouter.goRouter,
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.lightTheme(context),
          title: "E-Commerce App",

        );
      },
    );
  }
}
