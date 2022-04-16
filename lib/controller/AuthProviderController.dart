import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view/auth/login_page.dart';
import '../view/auth/register_page.dart';
import '../view/main/main_page.dart';

class AuthProviderController extends ChangeNotifier {
  directAfterSplashScreen(context) {
    Timer(
      const Duration(seconds: 3),
      () {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginPage()));
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MainPage()));
        }
      },
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signIn(context) async {
    await signInWithGoogle();

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("User tidak ditemukan!")));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const RegisterPage()));
    }
  }

  signOut(context) async {
    await GoogleSignIn().signOut;
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false);
  }
}
