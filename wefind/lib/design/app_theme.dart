import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTheme {
  ThemeData get themeData {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColorBrightness: Brightness.dark,
      brightness: Brightness.dark,
      indicatorColor: Colors.white,
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        backgroundColor: Color.fromARGB(255, 112, 42, 37),
        elevation: 0,
        centerTitle: true,
      ),
      // textButtonTheme: TextButtonThemeData(),
      // dividerTheme: DividerThemeData(color: Colors.white24,),
      textTheme: TextTheme().copyWith(
        //* Heading
        headline1: GoogleFonts.montserrat(
          fontSize: 56.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        //* Text Heading
        headline2: GoogleFonts.montserrat(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        //* Text Subheading
        headline3: GoogleFonts.montserrat(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),

        //* Body Text
        bodyText1: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 15.0,
        ),
        //* Emphasised Ingress
        bodyText2: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
