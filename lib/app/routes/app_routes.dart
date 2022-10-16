import 'package:flutter/material.dart';
import '../../auth/forgot_password/forgot_password.dart';
import '../../auth/signin/view/signin_page.dart';
import '../../auth/signup/view/signup_page.dart';
import '../../main/view/home_page/view/home_page.dart';
import '../../main/view/main_page.dart';
import '../../splash/view/splash_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (BuildContext context) => const SplashPage(),
    '/signin': (BuildContext context) => const SignInPage(),
    '/signup': (BuildContext context) => const SignUpPage(),
    '/main': (BuildContext context) => const MainPage(),
    '/forgot_password': (BuildContext context) => const ForgotPassword(),
    '/home_page': (BuildContext context) => const HomePage(),
    //   '/product': (BuildContext context) => const ProductDetailsPage(),
    //   '/favourite': (BuildContext context) => const FavouritePage(),
    //   '/cart': (BuildContext context) => CartPage(),
    // };
  };
}
