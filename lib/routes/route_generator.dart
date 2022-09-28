import 'package:chat_app_b/Authenticate/Autheticate.dart';
import 'package:chat_app_b/Authenticate/CreateAccount.dart';
import 'package:chat_app_b/Authenticate/LoginScreen.dart';
import 'package:chat_app_b/routes/routes.dart';
import 'package:chat_app_b/screens/HomeScreen.dart';
import 'package:chat_app_b/screens/authentication/intro_screen.dart';
import 'package:chat_app_b/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    print('args $settings');

    if (settings.name == Routes.splash) {
      return PageTransition(
          child: const SplashScreen(), type: PageTransitionType.rightToLeft);
    }
    if (settings.name == Routes.home) {
      return PageTransition(
          child: HomeScreen(), type: PageTransitionType.rightToLeft);
    }

    if (settings.name == Routes.login) {
      return PageTransition(
          child: const LoginScreen(), type: PageTransitionType.rightToLeft);
    }

    if (settings.name == Routes.intro) {
      return PageTransition(
          child: const IntroScreen(), type: PageTransitionType.rightToLeft);
    }

    if (settings.name == Routes.signup) {
      return PageTransition(
          child: const CreateAccount(), type: PageTransitionType.rightToLeft);
    }
    return null;
  }
}
