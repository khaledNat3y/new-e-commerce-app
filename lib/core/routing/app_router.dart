import 'package:go_router/go_router.dart';
import 'package:new_e_commerce_app/core/routing/routes.dart';
import 'package:new_e_commerce_app/features/address_screen/ui/address_screen.dart';
import 'package:new_e_commerce_app/features/login_screen/ui/login_screen.dart';
import 'package:new_e_commerce_app/features/main_screen/ui/main_screen.dart';
import 'package:new_e_commerce_app/features/product_details_screen/ui/product_details_screen.dart';
import 'package:new_e_commerce_app/features/register_screen/ui/register_screen.dart';


class AppRouter {
  static GoRouter goRouter = GoRouter(
    initialLocation: Routes.mainScreen,
    routes: [
      GoRoute(
        name: Routes.loginScreen,
        path: Routes.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        name: Routes.registerScreen,
        path: Routes.registerScreen,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        name: Routes.mainScreen,
        path: Routes.mainScreen,
        builder: (context, state) => MainScreen(),
      ),
      GoRoute(
        name: Routes.productDetailsScreen,
        path: Routes.productDetailsScreen,
        builder: (context, state)  {
          final extra = state.extra as Map<String, dynamic>;
          return ProductDetailsScreen(product: extra,);
        },
      ),
      GoRoute(
        name: Routes.addressScreen,
        path: Routes.addressScreen,
        builder: (context, state)  => AddressScreen(),
      ),


    ]
  );
}