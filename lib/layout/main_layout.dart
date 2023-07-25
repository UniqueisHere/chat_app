import 'package:chat_app/core/constants/responsive/responsive_layout.dart';
import 'package:chat_app/features/home/views/home_screen.dart';
import 'package:chat_app/features/profile/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/constants/colors/colors.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    Scaffold(
      body: Container(
        child: const Center(
          child: Text('Profile Screen'),
        ),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Favorite Screen'),
      ),
    ),
    Scaffold(
      body: Container(
        child: const Center(
          child: Text('Chat Screen'),
        ),
      ),
    ),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.house,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.heart,
                ),
                label: 'Favorite'),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.plus,
                ),
                label: 'Add'),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.comment,
                ),
                label: 'Favorite'),
            BottomNavigationBarItem(
                icon: FaIcon(
                  Icons.person,
                ),
                label: 'Profile'),
          ],
          currentIndex: currentIndex,
          onTap: (value) {
            setState(
              () {
                currentIndex = value;
              },
            );
          },
          backgroundColor: AllColors.scaffoldColor,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          // selectedItemColor: Colors.white,
        ),
      ),
      tablet: Container(),
      windows: Container(),
    );
  }
}
