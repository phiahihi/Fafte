import 'package:chat_app_b/screens/authentication/intro_screen.dart';

import '../screens/HomeScreen.dart';
import 'LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return HomeScreen();
    } else {
      return const IntroScreen();
    }
  }
}
