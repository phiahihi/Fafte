import 'package:chat_app_b/auth/intro/view/intro_page.dart';
import 'package:chat_app_b/auth/signin/signin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repository/app_repository.dart';
import '../../data/sharedprefs/constants.dart';
import '../../main/view/main_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  Future<List<bool>> isFirstTime() async {
    final appRepository = AppRepository();
    final _prefs = await SharedPreferences.getInstance();
    final userState = [true, false];
    if (_prefs.getBool(Preferences.is_new_user) == false) {
      userState[0] = false;
      print(userState[0]);
    }
    if (_prefs.getBool(Preferences.is_logged_in) == true) {
      userState[1] = true;
    }
    // appRepository.setUserId(_prefs.getString(Preferences.user_id));
    print(appRepository.getUserId);
    return userState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<bool>>(
        future: isFirstTime(),
        builder: (BuildContext context, AsyncSnapshot<List<bool>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.data![0] == true && snapshot.data![1] == false) {
              // Not logged in and a new user
              return const IntroScreen();
            }
            if (snapshot.data![0] == false && snapshot.data![1] == false) {
              // Not a new user and not logged in
              return const SignInPage();
            }
            if (snapshot.data![0] == false && snapshot.data![1] == true) {
              // Not a new user and logged in
              return const SignInPage();
            }
            return const MainPage();
          }
        },
      ),
    );
  }
}
