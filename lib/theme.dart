import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.indigo,
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.fugazOne(
        fontSize: 40, fontWeight: FontWeight.w500, color: Colors.indigo),
    headlineMedium:
        GoogleFonts.raleway(fontSize: 40, fontWeight: FontWeight.w700),
    headlineSmall: GoogleFonts.raleway(fontSize: 24),
    bodySmall: GoogleFonts.raleway(fontSize: 14),
    bodyMedium: GoogleFonts.raleway(fontSize: 16),
    bodyLarge: GoogleFonts.raleway(fontSize: 18),
    labelMedium: GoogleFonts.raleway(fontSize: 11),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.deepPurple,
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.fugazOne(
      fontSize: 40,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium:
        GoogleFonts.raleway(fontSize: 40, fontWeight: FontWeight.w700),
    headlineSmall: GoogleFonts.raleway(fontSize: 24),
    bodySmall: GoogleFonts.raleway(fontSize: 14),
    bodyMedium: GoogleFonts.raleway(fontSize: 16),
    bodyLarge: GoogleFonts.raleway(fontSize: 18),
    labelMedium: GoogleFonts.raleway(fontSize: 11),
  ),
);
