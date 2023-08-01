import 'package:chat_app/core/constants/routes/routes.dart';
import 'package:chat_app/core/constants/themes/themes_provider.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ChatThemes.lightTheme,
      darkTheme: ChatThemes.darkTheme,
      // themeMode: ThemeMode.system,
      // home: const LoginScreen(),
      routes: Routes.routes,
      initialRoute: Routes.login,
    );
  }
}
