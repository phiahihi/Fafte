import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontsApp {
  TextStyle fontBodyLarge = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.w900,
    ),
  );

  TextStyle fontBodyMedium = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: Colors.black.withOpacity(0.8),
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
  );

  TextStyle fontBodySmall = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: Colors.black.withOpacity(0.8),
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );
}
