import 'package:chat_app/features/home/views/home_screen.dart';
import 'package:chat_app/features/auth/views/login_screen.dart';
import 'package:chat_app/layout/layout.dart';
import 'package:flutter/material.dart';

import '../../../features/auth/views/signup_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(),
    '/signUp': (context) {
      return const SignUpScreen();
    },
    '/layout': (context) {
      return const Layout();
    }
  };
}
