import 'dart:developer';

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
      CartScreen(onBackButtonPressed: (index) {
        setState(() {
          currentIndex = index;
          log("$index");
        });
      },),
      AccountScreen(onBackButtonPressed: (index){
        setState(() {
          currentIndex = index;
        });
      },),
    ];
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      body: SafeArea(child: screens[currentIndex]),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      fixedColor: AppColors.primaryColor,
      selectedLabelStyle: AppTheme.font12BlackMedium,
      unselectedItemColor: AppColors.textFieldGreyColor,
      unselectedLabelStyle: AppTheme.font12GreyMedium,
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
        if(index == 1) {
          context.read<CartCubit>().getUserCart();
        }
      },
      items: [
        BottomNavigationBarItem(icon: SvgPicture.asset(Assets.inactiveHomeInactive), activeIcon: SvgPicture.asset(Assets.activeHomeActive),label: "Home",),
        BottomNavigationBarItem(icon: SvgPicture.asset(Assets.inactiveCartInactive),activeIcon: SvgPicture.asset(Assets.activeCartActive), label: "Cart"),
        BottomNavigationBarItem(icon: SvgPicture.asset(Assets.inactiveUserInactive), activeIcon: SvgPicture.asset(Assets.activeUserActive), label: "Account"),
      ],
    );
  }
}
