import 'package:flutter/material.dart';

class MyThemes {
  static final primary = Color(0xFF76C79E);
  static final primaryColor = Color(0xFF76C79E);
  static final primaryColorDark = Colors.grey.shade800;

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      primaryColor: primaryColorDark,
      colorScheme: ColorScheme.dark(primary: primary),
      dividerColor: Colors.white,
      brightness: Brightness.dark,
      textTheme: const TextTheme(button: TextStyle(color: Colors.black54))
      //shadowColor: Colors.black.withOpacity(0.7),
      );

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: primaryColor,
      colorScheme: ColorScheme.light(primary: primary),
      dividerColor: Colors.black,
      brightness: Brightness.light,
      textTheme: const TextTheme(button: TextStyle(color: Colors.white70))
      //shadowColor: Colors.grey.withOpacity(0.1),
      );
}
