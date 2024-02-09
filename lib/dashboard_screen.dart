import 'package:coding_challenge/base_screen.dart';
import 'package:coding_challenge/update_tax_data_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
