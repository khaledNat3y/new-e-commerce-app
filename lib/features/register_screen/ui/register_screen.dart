import 'package:flutter/material.dart';
import 'package:new_e_commerce_app/features/register_screen/ui/widgets/register_screen_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(child: RegisterScreenBody()),
    );
  }
}

