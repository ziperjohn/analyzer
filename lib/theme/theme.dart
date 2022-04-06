import 'package:flutter/material.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

//* ------------------------------------------------------------
//* LIGHT THEME
//* ------------------------------------------------------------

ThemeData lightTheme = ThemeData(
  fontFamily: GoogleFonts.inter().fontFamily,
  brightness: Brightness.light,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    primaryContainer: primaryColor,
    onPrimary: blackColor,
    secondary: secondaryColor,
    secondaryContainer: secondaryColor,
    onSecondary: blackColor,
    surface: darkSurfaceColor,
    onSurface: blackColor,
    background: darkBackgroundColor,
    onBackground: blackColor,
    error: redColor,
    onError: blackColor,
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
      color: blackColor,
    ),
    headline3: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w600,
      color: blackColor,
    ),
    headline4: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: blackColor,
    ),
    headline5: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: blackColor,
    ),
    headline6: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: blackColor,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: blackColor,
      letterSpacing: 0.15,
    ),
    subtitle2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: blackColor,
      letterSpacing: 0.1,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: blackColor,
      letterSpacing: 0.5,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: blackColor,
      letterSpacing: 0.25,
    ),
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: darkGrayColor,
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
      color: blackColor,
      letterSpacing: 1.5,
    ),
  ),
  scaffoldBackgroundColor: lightBackgroundColor,
  appBarTheme: const AppBarTheme(backgroundColor: lightSurfaceColor),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: lightSurfaceColor),
  cardTheme: CardTheme(
    color: lightSurfaceColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: lightSurfaceColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30)))),
  dialogTheme: const DialogTheme(backgroundColor: lightSurfaceColor),
  tabBarTheme: const TabBarTheme(labelColor: blackColor),
  radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all(primaryColor)),
);

//* ------------------------------------------------------------
//* DARK THEME
//* ------------------------------------------------------------

ThemeData darkTheme = ThemeData(
  fontFamily: GoogleFonts.inter().fontFamily,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: primaryColor,
    primaryContainer: primaryColor,
    onPrimary: whiteColor,
    secondary: secondaryColor,
    secondaryContainer: secondaryColor,
    onSecondary: whiteColor,
    surface: darkSurfaceColor,
    onSurface: whiteColor,
    background: darkBackgroundColor,
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
      color: whiteColor,
    ),
    headline5: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: whiteColor,
    ),
    headline6: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: whiteColor,
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
  scaffoldBackgroundColor: darkBackgroundColor,
  appBarTheme: const AppBarTheme(backgroundColor: darkSurfaceColor),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: darkSurfaceColor),
  cardTheme: CardTheme(
    color: darkSurfaceColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: darkSurfaceColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30)))),
  dialogTheme: const DialogTheme(backgroundColor: darkSurfaceColor),
  tabBarTheme: const TabBarTheme(labelColor: whiteColor),
  radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all(primaryColor)),
);
