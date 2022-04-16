import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controller/AuthProviderController.dart';
import 'package:flutter_bootcamp/view/auth/login_page.dart';
import 'package:flutter_bootcamp/view/main/main_page.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProviderController>(context, listen: false)
        .directAfterSplashScreen(context);
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/auth/ic_splash.png",
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
      backgroundColor: const Color(0xFF3A7FD5),
    );
  }
}
