import 'package:flutter/material.dart';

GlobalKey<NavigatorState> globalnavigatorKey = GlobalKey<NavigatorState>();

class Routes {
  // Authentica
  static const String intro = "/intro";
  static const String splash = "/splash";
  static const String login = "/login";
  static const String signup = "/signup";
  static const String forgotPassword = "/forgot-password";

  static const String home = "/home";
}

navigateTo(String name) {
  globalnavigatorKey.currentState?.pushReplacementNamed(name);
}
