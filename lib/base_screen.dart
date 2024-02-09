import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final Widget body;

  const BaseScreen({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: body,
      ),
    );
  }
}
