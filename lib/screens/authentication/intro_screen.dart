import 'package:chat_app_b/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Text(
              'Wellcome',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Automatic identity verification which Enable you to verify',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 48,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 300,
            ),
            const SizedBox(
              height: 48,
            ),
            _buildButton(size, 'Đăng nhập', () {
              navigateTo(Routes.login);
            }),
            const SizedBox(
              height: 16,
            ),
            _buildButton(size, 'Đăng ký', () {
              navigateTo(Routes.signup);
            }),
          ]),
        ),
      ),
    );
  }

  Widget _buildButton(Size size, String text, void Function()? onPressed) {
    return SizedBox(
      width: size.width,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              width: 2,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
