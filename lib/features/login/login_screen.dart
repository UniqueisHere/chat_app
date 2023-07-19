import 'package:chat_app/core/constants/colors/colors.dart';
import 'package:chat_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.scaffoldColor,
      body: Column(
        children: [
          CustomText(
            color: AllColors.textColor,
            size: 12,
            text: 'Hello, Welcome Back!',
          ),
          CustomText(
            color: AllColors.textColor,
            size: 12,
            text: 'Please Login to continue.',
          ),
          const TextField(
            autocorrect: false,
            decoration: InputDecoration(
              hintText: 'Username',
              labelText: 'Please Enter the user name',
              // labelStyle: TextField.materialMisspelledTextStyle,
            ),
          ),
          const TextField(
            autocorrect: false,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Please Enter the Password',
              // labelStyle: TextField.materialMisspelledTextStyle,
            ),
          ),
          TextButton(
            onPressed: () {
              print('object');
            },
            child: CustomText(
              color: AllColors.textColor,
              size: 12,
              text: 'Forgot password?',
            ),
          ),
          const CustomText(
              color: Colors.black, size: 12, text: 'Or login with'),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              children: [
                Image.asset(
                  'assets/images/facebook_logo.png',
                  width: 22,
                  height: 22,
                ),
                CustomText(
                  color: AllColors.textColor,
                  size: 12,
                  text: 'Log in with Facebook.',
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              children: [
                Image.asset(
                  'assets/images/google_logo.png',
                  width: 22,
                  height: 22,
                ),
                CustomText(
                  color: AllColors.textColor,
                  size: 12,
                  text: 'Log in with Google.',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
