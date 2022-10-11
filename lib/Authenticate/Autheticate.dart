import 'package:chat_app_b/auth/intro/view/intro_page.dart';
import 'package:chat_app_b/screens/home_page/home_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Authenticate({super.key});

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      print('hihih');
      return const HomePageScreen();
    } else {
      return const IntroScreen();
    }
  }
}
