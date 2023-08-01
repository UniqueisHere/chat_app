import 'package:chat_app/core/constants/colors/colors.dart';
import 'package:chat_app/core/constants/responsive/responsive_layout.dart';
import 'package:chat_app/core/constants/routes/routes.dart';
import 'package:chat_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_text_field.dart';
import '../services/auth_services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FocusScopeNode currentFocus = FocusScope.of(context);

        // if (!currentFocus.hasPrimaryFocus) {
        //   currentFocus.unfocus();
        // }
        // FocusManager.instance.primaryFocus?.unfocus();
        FocusScope.of(context).unfocus();
      },
      child: ResponsiveLayout(
        mobile: Scaffold(
          backgroundColor: AllColors.scaffoldColor,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Spacer(),
                      CustomText(
                        color: AllColors.textColor,
                        size: 100,
                        text: 'Sign Up 😉',
                        fontWeight: FontWeight.bold,
                      ),
                      // const Spacer(),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        hintText: 'Username',
                        textController: usernameController,
                        obscureText: false,
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'Please enter some text';
                        //   }
                        //   return null;
                        // },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        hintText: 'Please Enter the Email',
                        textController: emailController,
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          } else if (!value.contains('@')) {
                            return 'Invalid Email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        hintText: 'Please Enter the Password',
                        textController: passwordController,
                        obscureText: true,
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'Please enter some text';
                        //   }
                        //   return null;
                        // },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // print('object');
                          },
                          child: CustomText(
                            color: AllColors.textColor,
                            size: 5,
                            text: 'Forgot password?',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              AllColors.bottonColor,
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              AuthServices.signUpFirebase(
                                name: usernameController.text,
                                password: passwordController.text,
                                email: emailController.text,
                                context: context,
                              );
                            }
                          },
                          child: const CustomText(
                            color: Colors.black,
                            size: 12,
                            text: 'Sign Up',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              AllColors.bottonColor,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(Routes.login);
                          },
                          child: const CustomText(
                            color: Colors.black,
                            size: 12,
                            text: 'Log In',
                          ),
                        ),
                      ),

                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        tablet: Scaffold(
          backgroundColor: AllColors.scaffoldColor,
          body: GestureDetector(
            onTap: () {
              // FocusScopeNode currentFocus = FocusScope.of(context);

              // if (!currentFocus.hasPrimaryFocus) {
              //   currentFocus.unfocus();
              // }
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const Spacer(),
                      CustomText(
                        color: AllColors.textColor,
                        size: 12,
                        text: 'Hello, Welcome Back!',
                        // fontWeight:
                        //     Theme.of(context).textTheme.bodyLarge!.fontWeight,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomText(
                        color: AllColors.textColor,
                        size: 12,
                        text: 'Please Login to continue.',
                      ),
                      const Spacer(),
                      TextField(
                        autocorrect: false,
                        decoration: InputDecoration(
                          // hintText: 'Username',
                          labelText: 'Please Enter the user name',
                          fillColor: AllColors.textFieldColor,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          // labelStyle: TextField.materialMisspelledTextStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextField(
                        autocorrect: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          // hintText: 'Password',
                          labelText: 'Please Enter the Password',
                          fillColor: AllColors.textFieldColor,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          // labelStyle: TextField.materialMisspelledTextStyle,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // print('object');
                          },
                          child: CustomText(
                            color: AllColors.textColor,
                            size: 4,
                            text: 'Forgot password?',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              AllColors.bottonColor,
                            ),
                          ),
                          onPressed: () {},
                          child: const CustomText(
                            color: Colors.black,
                            size: 12,
                            text: 'Login',
                          ),
                        ),
                      ),
                      const Spacer(),
                      CustomText(
                        color: AllColors.textColor,
                        size: 12,
                        text: 'Or login with',
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AllColors.whiteColor,
                            foregroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(56),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/facebook_logo.png',
                                width: 22,
                                height: 22,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              CustomText(
                                color: AllColors.blackColor,
                                size: 12,
                                text: 'Log in with Facebook.',
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AllColors.whiteColor,
                            foregroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(56),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/google_logo.png',
                                width: 22,
                                height: 22,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              CustomText(
                                color: AllColors.blackColor,
                                size: 12,
                                text: 'Log in with Google.',
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          CustomText(
                            color: AllColors.textColor,
                            size: 12,
                            text: "Don't have an account?",
                          ),
                          CustomText(
                            color: AllColors.bottonColor,
                            size: 12,
                            text: "SignUp",
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        windows: Scaffold(
          backgroundColor: AllColors.scaffoldColor,
          body: GestureDetector(
            onTap: () {
              // FocusScopeNode currentFocus = FocusScope.of(context);

              // if (!currentFocus.hasPrimaryFocus) {
              //   currentFocus.unfocus();
              // }
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const Spacer(),
                      CustomText(
                        color: AllColors.textColor,
                        size: 100,
                        text: 'Hello, Welcome Back!',
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomText(
                        color: AllColors.textColor,
                        size: 12,
                        text: 'Please Login to continue.',
                      ),
                      const Spacer(),
                      TextField(
                        autocorrect: false,
                        decoration: InputDecoration(
                          // hintText: 'Username',
                          labelText: 'Please Enter the user name',
                          fillColor: AllColors.textFieldColor,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          // labelStyle: TextField.materialMisspelledTextStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextField(
                        autocorrect: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          // hintText: 'Password',
                          labelText: 'Please Enter the Password',
                          fillColor: AllColors.textFieldColor,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          // labelStyle: TextField.materialMisspelledTextStyle,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // print('object');
                          },
                          child: CustomText(
                            color: AllColors.textColor,
                            size: 12,
                            text: 'Forgot password?',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              AllColors.bottonColor,
                            ),
                          ),
                          onPressed: () {},
                          child: const CustomText(
                            color: Colors.black,
                            size: 12,
                            text: 'Login',
                          ),
                        ),
                      ),
                      const Spacer(),
                      CustomText(
                        color: AllColors.textColor,
                        size: 12,
                        text: 'Or login with',
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AllColors.whiteColor,
                            foregroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(56),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/facebook_logo.png',
                                width: 22,
                                height: 22,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              CustomText(
                                color: AllColors.blackColor,
                                size: 12,
                                text: 'Log in with Facebook.',
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AllColors.whiteColor,
                            foregroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(56),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/google_logo.png',
                                width: 22,
                                height: 22,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              CustomText(
                                color: AllColors.blackColor,
                                size: 12,
                                text: 'Log in with Google.',
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          CustomText(
                            color: Theme.of(context).canvasColor,
                            size: 12,
                            text: "Don't have an account?",
                          ),
                          CustomText(
                            color: AllColors.bottonColor,
                            size: 12,
                            text: "SignUp",
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
