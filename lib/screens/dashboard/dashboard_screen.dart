import 'package:coding_challenge/models/user.dart';
import 'package:coding_challenge/screens/base_screen.dart';
import 'package:coding_challenge/screens/dashboard/update_tax_data_sheet.dart';
import 'package:coding_challenge/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class DashboardScreen extends StatelessWidget {

  final User user;
  DashboardScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    //todo: make login check, that can be used on different screens
    if (!GetIt.instance<AuthService>().isLoggedIn()) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'Your session expired. Please login again.')));
      Navigator.pop(context);
    }
    return BaseScreen(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome ${user.firstName} ${user.lastName}'),
            SvgPicture.asset("assets/CryingGirl.svg"),
            FilledButton(
              onPressed: () {
                showModalBottomSheet(context: context, builder: (context) {
                  return UpdateTaxData();
                });
              },
              child: const Text("Update your tax data"),
            ),
          ],
        ),
      ),
    );
  }
}
