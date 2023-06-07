import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'colors.dart';

class PhotoTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.sourceSansPro(
        fontSize: 20.0, fontWeight: FontWeight.w600,
    ),
    displayLarge: GoogleFonts.sourceSansPro(
        fontSize: 32.0, fontWeight: FontWeight.w600,
    ),
    displaySmall: GoogleFonts.sourceSansPro(
        fontSize: 14.0, fontWeight: FontWeight.w500,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: GoogleFonts.sourceSansPro(
        fontSize: 22.0, fontWeight: FontWeight.w600,
    ),
    displayLarge: GoogleFonts.sourceSansPro(
        fontSize: 32.0, fontWeight: FontWeight.w600,
    ),
    displaySmall: GoogleFonts.sourceSansPro(
        fontSize: 16.0, fontWeight: FontWeight.w500,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black, backgroundColor: Colors.white),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white, backgroundColor: Colors.black),
      bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(selectedItemColor: Colors.green),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white, backgroundColor: Colors.green),
      bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(selectedItemColor: Colors.green),
      textTheme: darkTextTheme,
    );
  }
}