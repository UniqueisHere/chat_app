import 'package:chat_app/features/auth/services/firestore_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  static signUpFirebase({
    required String name,
    required String password,
    required String email,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      await FirestoreServices.saveUser(name, email, userCredential.user!.uid);
      // customSnackBar(
      //   backgroundColor: Colors.greenAccent,
      //   context: context,
      //   customText: CustomText(
      //     color: AllColors.whiteColor,
      //     size: 12,
      //     text: 'Registration Successful',
      //   ),
      //   durationInSeconds: 2,
      // );
      print('Registration Successful');
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        // customSnackBar(
        //   backgroundColor: Colors.greenAccent,
        //   context: context,
        //   customText: const CustomText(
        //     color: Colors.red,
        //     size: 12,
        //     text: 'Password is too weak. Enter strong password.',
        //   ),
        //   durationInSeconds: 2,
        // );
        print('Weak Password');
      } else if (error.code == 'email-already-in-use') {
        // customSnackBar(
        //   backgroundColor: Colors.greenAccent,
        //   context: context,
        //   customText: const CustomText(
        //     color: Colors.red,
        //     size: 12,
        //     text: 'Email already exists. Please enter new email.',
        //   ),
        //   durationInSeconds: 2,
        // );
        print('Email Exists');
      }
    } catch (error) {
      // customSnackBar(
      //   backgroundColor: Colors.greenAccent,
      //   context: context,
      //   customText: CustomText(
      //     color: Colors.red,
      //     size: 12,
      //     text: 'Error. ${error.toString()}',
      //   ),
      //   durationInSeconds: 2,
      // );
      print('Something went wrong');
    }
  }

  static signInFirebase(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // customSnackBar(
      //   backgroundColor: Colors.greenAccent,
      //   context: context,
      //   customText: const CustomText(
      //     color: Colors.greenAccent,
      //     size: 12,
      //     text: 'Successfully logged in',
      //   ),
      //   durationInSeconds: 2,
      // );
      print('Login Successful');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // customSnackBar(
        //   backgroundColor: Colors.greenAccent,
        //   context: context,
        //   customText: const CustomText(
        //     color: Colors.red,
        //     size: 12,
        //     text: 'No user Found with this Email',
        //   ),
        //   durationInSeconds: 2,
        // );
        print('Nouser with this email');
      } else if (e.code == 'wrong-password') {
        // customSnackBar(
        //   backgroundColor: Colors.greenAccent,
        //   context: context,
        //   customText: const CustomText(
        //     color: Colors.red,
        //     size: 12,
        //     text: 'Password did not match.',
        //   ),
        //   durationInSeconds: 2,
        // );
        print('Wrong password');
      }
    } catch (error) {
      // customSnackBar(
      //   backgroundColor: Colors.greenAccent,
      //   context: context,
      //   customText: CustomText(
      //     color: Colors.red,
      //     size: 12,
      //     text: 'Error. ${error.toString()}',
      //   ),
      //   durationInSeconds: 2,
      // );
      print('Something went wrong');
    }
  }
}
