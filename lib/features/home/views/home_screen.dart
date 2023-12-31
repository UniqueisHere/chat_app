import 'package:chat_app/core/constants/app_texts/app_texts.dart';
import 'package:chat_app/core/constants/colors/colors.dart';
import 'package:chat_app/core/constants/responsive/responsive_layout.dart';
import 'package:chat_app/core/constants/routes/routes.dart';
import 'package:chat_app/features/home/widgets/home_menu.dart';
import 'package:chat_app/features/home/widgets/user_items.dart';
import 'package:chat_app/layout/custom_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<String> users = [];

  @override
  Widget build(BuildContext context) {
    usersFromBackend();
    return ResponsiveLayout(
      mobile: Scaffold(
        backgroundColor: AllColors.scaffoldColor,
        appBar: CustomAppBar(
          title: AppTexts.fiveMinFlutter,
          appBarActions: [
            PopupMenuButton(
              onSelected: (value) {
                switch (value) {
                  case HomeMenu.logout:
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).popAndPushNamed(Routes.login);
                    break;
                  case HomeMenu.nothing:
                    break;
                  default:
                }
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<HomeMenu>(
                    value: HomeMenu.logout,
                    child: Text(AppTexts.logout),
                  ),
                  const PopupMenuItem<HomeMenu>(
                    value: HomeMenu.nothing,
                    child: Text('Nothing'),
                  ),
                ];
              },
            )
          ],
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return UserItem(
              userName: users[index],
            );
          },
          itemCount: users.length,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
        ),
      ),
      tablet: Container(),
      windows: Container(),
    );
  }

  usersFromBackend() {
    for (var i = 0; i <= 20; i++) {
      users.add('User $i');
    }
  }
}
