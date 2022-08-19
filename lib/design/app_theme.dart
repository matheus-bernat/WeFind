import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get themeData {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColorBrightness: Brightness.dark,
      brightness: Brightness.dark,
      indicatorColor: Colors.white,
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      textButtonTheme: TextButtonThemeData(),
      dividerTheme: DividerThemeData(
        color: Colors.white24,
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
                color: Color.fromARGB(255, 230, 225, 225),
                fontWeight: FontWeight.bold),
            headline6:
                const TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
          ),
    );
  }
}
