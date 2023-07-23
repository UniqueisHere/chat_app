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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration Successful.'),
          backgroundColor: Colors.greenAccent,
          dismissDirection: DismissDirection.up,
          duration: Duration(
            seconds: 2,
          ),
        ),
      );
      Navigator.of(context).pushReplacementNamed('/home');
      // print('Registration Successful');
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password too weak.'),
            backgroundColor: Colors.red,
            dismissDirection: DismissDirection.up,
            duration: Duration(
              seconds: 2,
            ),
          ),
        );
      } else if (error.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email Already Exists.'),
            backgroundColor: Colors.red,
            dismissDirection: DismissDirection.up,
            duration: Duration(
              seconds: 2,
            ),
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error $error.'),
          backgroundColor: Colors.red,
          dismissDirection: DismissDirection.up,
          duration: const Duration(
            seconds: 2,
          ),
        ),
      );
    }
  }

  static signInFirebase(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sucessfully Loggedin.'),
          backgroundColor: Colors.greenAccent,
          dismissDirection: DismissDirection.up,
          duration: Duration(
            seconds: 2,
          ),
        ),
      );
      Navigator.of(context).pushReplacementNamed('/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No user with this email'),
            backgroundColor: Colors.red,
            dismissDirection: DismissDirection.up,
            duration: Duration(
              seconds: 2,
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wrong Password'),
            backgroundColor: Colors.red,
            dismissDirection: DismissDirection.up,
            duration: Duration(
              seconds: 2,
            ),
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error $error.'),
          backgroundColor: Colors.red,
          dismissDirection: DismissDirection.up,
          duration: const Duration(
            seconds: 2,
          ),
        ),
      );
    }
    // try {
    //   final credential = await FirebaseAuth.instance
    //       .signInWithEmailAndPassword(email: email, password: password);
    //   print('User successfully logged in.');
    //   Navigator.of(context).pushReplacementNamed('/home');
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     print('No user found for that email.');
    //   } else if (e.code == 'wrong-password') {
    //     print('Wrong password provided for that user.');
    //   }
    // } catch (e) {
    //   print(e.toString());
    // }
  }
}
