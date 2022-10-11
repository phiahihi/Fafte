import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../constants/sizes.dart';
import '../../../wigdets/buttons.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.colorTheme,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SizesApp.s16),
          child: SingleChildScrollView(
            child: Column(children: [
              Text(
                'Wellcome',
                style: FontsApp().fontBodyLarge,
              ),
              const SizedBox(
                height: SizesApp.s8,
              ),
              Text(
                'Automatic identity verification which Enable you to verify',
                style: FontsApp().fontBodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: SizesApp.s48,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: SizesApp.s48 * 6,
              ),
              const SizedBox(
                height: SizesApp.s48,
              ),
              OutlineButton(
                text: 'Đăng nhập',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/signin', (route) => false);
                },
              ),
              const SizedBox(
                height: SizesApp.s16,
              ),
              OutlineButton(
                text: 'Đăng kí',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/signup', (route) => false);
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
