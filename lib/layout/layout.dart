import 'package:chat_app/core/constants/colors/colors.dart';
import 'package:chat_app/core/constants/responsive/responsive_layout.dart';
import 'package:chat_app/features/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    Container(
      child: const Center(
        child: Text('Profile Screen'),
      ),
    ),
    Container(
      child: const Center(
        child: Text('Favorite Screen'),
      ),
    ),
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
                  FontAwesomeIcons.a,
                ),
                label: 'A'),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.addressBook,
                ),
                label: 'B'),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.addressBook,
                ),
                label: 'B'),
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
        ),
      ),
      tablet: Container(),
      windows: Container(),
    );
  }
}
