import 'package:flutter/material.dart';
import 'package:new_e_commerce_app/features/login_screen/ui/widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: LoginScreenBody()),
    );
  }
}
