import 'package:chat_app/core/constants/colors/colors.dart';
import 'package:chat_app/core/constants/responsive/responsive_layout.dart';
import 'package:chat_app/core/widgets/custom_text.dart';
import 'package:chat_app/features/home/widgets/user_items.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Scaffold(
          backgroundColor: AllColors.scaffoldColor,
          appBar: AppBar(
            backgroundColor: AllColors.scaffoldColor,
            elevation: 1,
            title: CustomText(
              color: AllColors.textColor,
              size: 12,
              text: '5MinuteFlutter',
            ),
            actions: [
              Icon(
                Icons.location_on_outlined,
                color: AllColors.textColor,
              ),
              TextButton(
                onPressed: () async {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacementNamed('/');
                },
                child: const Text('Logout'),
              ),
            ],
          ),
          body: ListView(
            children: usersFromBackend(),
          )),
      tablet: Container(),
      windows: Container(),
    );
  }

  List<Widget> usersFromBackend() {
    List<Widget> users = [];
    for (var i = 0; i <= 1000; i++) {
      users.add(const UserItem());
    }
    return users;
  }
}
