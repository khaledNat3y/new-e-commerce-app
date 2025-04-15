import 'package:go_router/go_router.dart';
import 'package:new_e_commerce_app/core/routing/routes.dart';
import 'package:new_e_commerce_app/features/login_screen/ui/login_screen.dart';
import 'package:new_e_commerce_app/features/register_screen/ui/register_screen.dart';


class AppRouter {
  static GoRouter goRouter = GoRouter(
    initialLocation: Routes.registerScreen,
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


    ]
  );
}