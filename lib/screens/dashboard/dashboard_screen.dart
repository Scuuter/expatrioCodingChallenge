import 'package:coding_challenge/screens/base_screen.dart';
import 'package:coding_challenge/screens/dashboard/update_tax_data_sheet.dart';
import 'package:coding_challenge/services/singletons/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = GetIt.instance<AuthService>();
    return BaseScreen(
      loginRequired: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Welcome ${authService.user?.firstName} ${authService.user?.lastName}'),
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
