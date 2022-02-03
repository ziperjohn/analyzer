import 'package:flutter/material.dart';
import 'package:analyzer_app/theme/colors.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: primaryColor,
    primaryVariant: primaryColor,
    onPrimary: whiteColor,
    secondary: secondaryColor,
    secondaryVariant: secondaryColor,
    onSecondary: whiteColor,
    surface: surfaceColor,
    onSurface: whiteColor,
    background: backgroundColor,
    onBackground: whiteColor,
    error: redColor,
    onError: whiteColor,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w900,
      color: secondaryColor,
    ),
    headline2: TextStyle(
      fontSize: 27,
      fontWeight: FontWeight.w700,
      color: whiteColor,
    ),
    headline3: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w600,
      color: whiteColor,
    ),
    headline4: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.purple,
    ),
    headline5: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.orange,
    ),
    headline6: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.brown,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: whiteColor,
      letterSpacing: 0.15,
    ),
    subtitle2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: whiteColor,
      letterSpacing: 0.1,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: whiteColor,
      letterSpacing: 0.5,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: whiteColor,
      letterSpacing: 0.25,
    ),
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: lightGrayColor,
      letterSpacing: 0.4,
    ),
    button: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: whiteColor,
      letterSpacing: 1.25,
    ),
    overline: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: whiteColor,
      letterSpacing: 1.5,
    ),
  ),
  scaffoldBackgroundColor: backgroundColor,
);
