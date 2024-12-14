import 'package:flutter/material.dart';

import '../Constants/app_colors.dart';
import '../Gen/fonts.gen.dart';

class Themes {
  //! Light theme configuration
  static final light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white
    )),

    primaryColor: AppColors.primary, //* Primary color for the light theme
    appBarTheme: AppBarTheme(
      backgroundColor:
          Colors.white, //* Transparent background for the AppBar
      iconTheme:
          IconThemeData(color: AppColors.primary), //* Icon color in the AppBar
    ),
    iconTheme: IconThemeData(color: AppColors.secondary), //* Default icon color
    textTheme: _getTextTheme(isDarkMode: false), //* Add text theme
  );

  //! Dark theme configuration
  static final dark = ThemeData(
    primaryColor: AppColors.secondary,
    //* Primary color for the dark theme
    scaffoldBackgroundColor: AppColors.primary,
    //* Background color for the scaffold
    appBarTheme: AppBarTheme(
      backgroundColor:
          Colors.transparent, //* Transparent background for the AppBar
      iconTheme: IconThemeData(
          color: AppColors.secondary), //* Icon color in the AppBar
    ),
    iconTheme: IconThemeData(color: AppColors.secondary),
    //* Default icon color
    textTheme: _getTextTheme(isDarkMode: true), //* Add text theme
  );

  //! Function to get text theme based on dark mode setting
  static TextTheme _getTextTheme({required bool isDarkMode}) {
    var fontfamily = FontFamily.irs;
    Color textColor = isDarkMode ? AppColors.secondary : AppColors.primary;
    return TextTheme(
      labelSmall:
          TextStyle(
            fontFamily: fontfamily,
              fontSize: 8, fontWeight: FontWeight.w400, color: textColor),
      labelMedium: TextStyle(
          fontFamily: fontfamily,
          fontSize: 10, fontWeight: FontWeight.w400, color: textColor),
      labelLarge: TextStyle(
          fontFamily: fontfamily,
          fontSize: 12, fontWeight: FontWeight.w400, color: textColor),
      bodySmall: TextStyle(
          fontFamily: fontfamily,
          fontSize: 14, fontWeight: FontWeight.w500, color: textColor),
      bodyMedium: TextStyle(
          fontFamily: fontfamily,
          fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
      bodyLarge: TextStyle(
          fontFamily: fontfamily,
          fontSize: 18, fontWeight: FontWeight.w500, color: textColor),
      headlineSmall: TextStyle(
          fontFamily: fontfamily,
          fontSize: 20, fontWeight: FontWeight.w500, color: textColor),
      headlineMedium: TextStyle(
          fontFamily: fontfamily,
          fontSize: 30, fontWeight: FontWeight.w500, color: textColor),
      headlineLarge: TextStyle(
          fontFamily: fontfamily,
          fontSize: 40, fontWeight: FontWeight.w500, color: textColor),
    );
  }
}
