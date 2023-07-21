import 'package:chat_app/core/constants/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Scaffold(
          body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text('Logout'),
        ),
      )),
      tablet: Container(),
      windows: Container(),
    );
  }
}
