import 'package:chat_app/features/home/views/home_screen.dart';
import 'package:chat_app/features/auth/views/login_screen.dart';
import 'package:chat_app/features/profile/views/edit_profile_screen.dart';
import 'package:chat_app/layout/main_layout.dart';
import 'package:flutter/material.dart';

import '../../../features/auth/views/signup_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const LoginScreen(),
    '/home': (context) => HomeScreen(),
    '/signUp': (context) {
      return const SignUpScreen();
    },
    '/layout': (context) {
      return const Layout();
    },
    '/edit_profile': (context) {
      return const EditProfileScreen();
    },
  };

  static const login = '/';
  static const home = '/home';
  static const signUp = '/signUp';
  static const layout = '/layout';
  static const editProfile = '/edit_profile';
}
