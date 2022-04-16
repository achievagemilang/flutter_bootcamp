import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controller/AuthProviderController.dart';
import 'package:flutter_bootcamp/view/auth/login_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late AuthProviderController controller;
  @override
  void initState() {
    super.initState();
    controller = Provider.of<AuthProviderController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  controller.signOut(context);
                },
                child: Text("SignOut")),
            Text("PROFILE"),
          ],
        ));
  }
}
