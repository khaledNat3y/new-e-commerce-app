import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:new_e_commerce_app/core/cubits/auth_cubit/auth_cubit.dart';
import 'package:new_e_commerce_app/core/routing/routes.dart';
import 'package:new_e_commerce_app/features/address_screen/ui/address_screen.dart';
import 'package:new_e_commerce_app/features/cart_screen/logic/cart_cubit.dart';
import 'package:new_e_commerce_app/features/home_screen/data/models/products_model.dart';
import 'package:new_e_commerce_app/features/login_screen/ui/login_screen.dart';
import 'package:new_e_commerce_app/features/main_screen/ui/main_screen.dart';
import 'package:new_e_commerce_app/features/product_details_screen/ui/product_details_screen.dart';
import 'package:new_e_commerce_app/features/register_screen/ui/register_screen.dart';
import 'package:new_e_commerce_app/features/splash_screen/ui/splash_screen.dart';

import '../../features/cart_screen/data/repo/cart_repo.dart';
import '../di/dependency_injection.dart';


class AppRouter {
  static GoRouter goRouter = GoRouter(
    initialLocation: Routes.splashScreen,
      // initialLocation: isLoggedInUser ? Routes.mainScreen : Routes.loginScreen,
      routes: [
        GoRoute(
          name: Routes.loginScreen,
          path: Routes.loginScreen,
          builder: (context, state) =>
              BlocProvider(
                create: (context) => getIt<AuthCubit>(),
                child: const LoginScreen(),
              ),
        ),
        GoRoute(
          name: Routes.registerScreen,
          path: Routes.registerScreen,
          builder: (context, state) =>
              BlocProvider(
                create: (context) => getIt<AuthCubit>(),
                child: const RegisterScreen(),
              ),
        ),
        GoRoute(
          name: Routes.mainScreen,
          path: Routes.mainScreen,
          builder: (context, state) =>
              BlocProvider(
                create: (context) => CartCubit(getIt<CartRepo>()),
                child: const MainScreen(),
              ),
        ),
        GoRoute(
          name: Routes.productDetailsScreen,
          path: Routes.productDetailsScreen,
          builder: (context, state) {
            final extra = state.extra as ProductsModel;
            return BlocProvider(
              create: (context) => CartCubit(getIt<CartRepo>()),
              child: ProductDetailsScreen(product: extra,),
            );
          },
        ),
        GoRoute(
          name: Routes.addressScreen,
          path: Routes.addressScreen,
          builder: (context, state) => const AddressScreen(),
          pageBuilder: GoTransitions.slide.toRight.withFade.call,
        ),
        /// Splash
        GoRoute(
          name: Routes.splashScreen,
          path: Routes.splashScreen,
          builder: (context, state) => const SplashScreen(),
        ),


      ]
  );
}