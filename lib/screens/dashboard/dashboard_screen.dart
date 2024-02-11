import 'package:coding_challenge/models/user.dart';
import 'package:coding_challenge/screens/base_screen.dart';
import 'package:coding_challenge/screens/dashboard/update_tax_data_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatelessWidget {

  final User user;
  DashboardScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
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
