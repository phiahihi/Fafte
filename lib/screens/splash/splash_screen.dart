import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

import '../../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showLoading = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(_checkAuth);
  }

  void _checkAuth(_) {
    if (_auth.currentUser != null) {
      Future.delayed(const Duration(seconds: 3), () async {
        if (!mounted) return;
        try {
          // await ref
          //     .read(package_provider.notifier)
          //     .loginBYUserIDIntoRevenueCat(userModel.data?.id ?? 0);

          // ref.read(auth_provider.notifier).userModel = userModel;
          navigateTo(Routes.home);
        } catch (e) {
          print(e);
          print(e.toString());
          setState(() {
            showLoading = false;
          });

          navigateTo(Routes.intro);
        }
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () async {
        if (!mounted) return;
        navigateTo(Routes.intro);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logoText.png",
                fit: BoxFit.contain,
              ),

              // Text("Medscrippts.",
              //     style: TextStyle(
              //         fontSize: ScreenSizes.vWidth(context) * 0.08,
              //         color: Color(0xff35364F),
              //         fontWeight: FontWeight.bold)),

              if (showLoading)
                CircularProgressIndicator(
                  color: Colors.black.withOpacity(0.8),
                )
            ],
          ),
        ),
      ),
    );
  }
}
