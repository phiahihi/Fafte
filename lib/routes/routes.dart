import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

GlobalKey<NavigatorState> globalnavigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static const String intro = "/intro";
  static const String splash = "/splash";
  static const String home = "/home";

  static const String login = "/login";
  static const String signup = "/signup";
}

navigateTo(String name) {
  globalnavigatorKey.currentState?.pushNamed(name);
}
