import 'package:coding_challenge/screens/dashboard/dashboard_screen.dart';
import 'package:coding_challenge/services/singletons/auth_service.dart';
import 'package:coding_challenge/shared/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextInputField(
              label: 'Email',
              validatorMessage: 'Please enter your email',
            ),
            const TextInputField(
              label: 'Password',
              validatorMessage: 'Please enter your password',
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Center(
                child: FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      GetIt.instance<AuthService>()
                          .login('tito+bs792@expatrio.com', 'nemampojma')
                          .then(
                            (user) => {
                              if (user != null)
                                {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DashboardScreen();
                                  }))
                                }
                              else
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'There was an error during login')),
                                  )
                                }
                            },
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Please enter your email and password')),
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
