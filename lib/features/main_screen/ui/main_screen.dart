import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Add this import
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_e_commerce_app/core/di/dependency_injection.dart';
import 'package:new_e_commerce_app/core/theming/app_theme.dart';
import 'package:new_e_commerce_app/features/account_screen/ui/account_screen.dart';
import 'package:new_e_commerce_app/features/cart_screen/logic/cart_cubit.dart';
import 'package:new_e_commerce_app/features/cart_screen/ui/cart_screen.dart';
import 'package:new_e_commerce_app/features/home_screen/data/repo/home_repo.dart';
import 'package:new_e_commerce_app/features/home_screen/logic/categories_cubit.dart';
import 'package:new_e_commerce_app/features/home_screen/logic/product_cubit.dart';
import 'package:new_e_commerce_app/features/home_screen/ui/home_screen.dart';

import '../../../core/theming/app_colors.dart';
import '../../../generated/assets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductCubit(getIt<HomeRepo>())),
          BlocProvider(create: (context) => CategoriesCubit(getIt<HomeRepo>())),
        ],
        child: const HomeScreen(),
      ),
      CartScreen(
        onBackButtonPressed: (index) {
          setState(() {
            currentIndex = index;
            log("$index");
            _bottomNavigationKey.currentState?.setPage(index);
          });
        },
      ),
      AccountScreen(
        onBackButtonPressed: (index) {
          setState(() {
            currentIndex = index;
            // Update curved navigation bar when back button is pressed
            _bottomNavigationKey.currentState?.setPage(index);
          });
        },
      ),
    ];

    return Scaffold(
      bottomNavigationBar: buildCurvedNavigationBar(),
backgroundColor: AppColors.white,
      body: SafeArea(child: screens[currentIndex]),
    );
  }

  // Replace BottomNavigationBar with CurvedNavigationBar
  CurvedNavigationBar buildCurvedNavigationBar() {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: currentIndex,
      height: 60, // Height of the navigation bar
      backgroundColor: AppColors.white, // Background color (visible in the curve)
      color: AppColors.primaryColor, // Navigation bar color
      buttonBackgroundColor: AppColors.primaryColor, // Selected item background color
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
        if (index == 1) {
          context.read<CartCubit>().getUserCart();
        }
      },
      items: [
        /// Home Icon
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                currentIndex == 0 ? Assets.activeHomeActive : Assets.inactiveHomeInactive,
                height: 22,
              ),
              if (currentIndex == 0)
                Text(
                  'Home',
                  style: AppTheme.font16WhiteMedium.copyWith(
                    fontSize: 12,

                  ),
                ),
            ],
          ),
        ),
        /// Cart Icon
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                currentIndex == 1 ? Assets.activeCartActive : Assets.inactiveCartInactive,
                height: 22,
              ),
              if (currentIndex == 1)
                Text(
                  'Cart',
                  style: AppTheme.font16WhiteMedium.copyWith(
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ),
        // Account Icon
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                currentIndex == 2 ? Assets.activeUserActive : Assets.inactiveUserInactive,
                height: 22,
              ),
              if (currentIndex == 2)
                Text(
                  'Account',
                  style: AppTheme.font16WhiteMedium.copyWith(
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}