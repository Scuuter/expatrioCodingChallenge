import 'package:coding_challenge/screens/login/login_screen.dart';
import 'package:coding_challenge/services/singletons/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BaseScreen extends StatelessWidget {
  final Widget body;
  final bool loginRequired;

  const BaseScreen({
    super.key,
    required this.body,
    required this.loginRequired,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: !loginRequired
            ? body
            : GetIt.instance<AuthService>().isLoggedIn()
                ? body
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Your session expired. Please login again.'),
                        FilledButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return LoginScreen();
                              }),
                            );
                          },
                          child: const Text("Go to login"),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
