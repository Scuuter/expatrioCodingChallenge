import 'package:coding_challenge/base_screen.dart';
import 'package:coding_challenge/login_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/2019_XP_logo_white.png',
              width: 200,
            ),
            LoginForm(),
            Lottie.asset('assets/login-background.json'),
          ],
        ),
      ),
    );
  }
}
