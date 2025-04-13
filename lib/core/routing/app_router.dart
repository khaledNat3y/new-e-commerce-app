import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:new_e_commerce_app/core/routing/routes.dart';


class AppRouter {
  static GoRouter goRouter = GoRouter(
    initialLocation: Routes.homeScreen,
    routes: [
      GoRoute(
        name: Routes.homeScreen,
        path: Routes.homeScreen,
        builder: (context, state) => Container(),
      ),


    ]
  );
}