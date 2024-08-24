import 'package:flutter/material.dart';

Color primaryText = const Color(0xFF1E1E1E);
Color secondaryText = Color.fromARGB(255, 92, 90, 90);

class AppThemes {
  static final ThemeData appTheme = ThemeData(
    brightness: Brightness
        .light, // Changed to light theme to match the logo's white color
    primaryColor: Color(0xFFDE2A51), // Logo background color
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: primaryText, // Accent color to match the primary color
      background: Colors.white, // Background color matching the logo's white
    ),
    scaffoldBackgroundColor: Colors.white, // Main background color
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Poppins',
        color: primaryText,
        fontSize: 22,
        letterSpacing: 0.20,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Poppins',
        color: primaryText,
        fontSize: 20,
        letterSpacing: 0.20,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Poppins',
        color: primaryText,
        fontSize: 18,
        letterSpacing: 0.20,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        color: secondaryText,
        fontSize: 12,
        letterSpacing: 0.20,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        color: primaryText,
        fontSize: 16,
        letterSpacing: 0.20,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        color: primaryText,
        fontSize: 14,
        letterSpacing: 0.20,
        fontWeight: FontWeight.normal,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Poppins',
        color: secondaryText,
        fontSize: 14,
        letterSpacing: 0.20,
        fontWeight: FontWeight.normal,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Poppins',
        color: secondaryText,
        fontSize: 14,
        letterSpacing: 0.20,
        fontWeight: FontWeight.w400,
      ),
      displayLarge: const TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontSize: 15,
        letterSpacing: 0.20,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: primaryText,
        fontFamily: 'Poppins',
        fontSize: 15,
        letterSpacing: 0.20,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: const TextStyle(
        color: Color(0xFFDE2A51),
        fontFamily: 'Poppins',
        fontSize: 14,
        letterSpacing: 0.20,
        fontWeight: FontWeight.w400,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white, // App bar background color
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white), // App bar icon color
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFDE2A51),
          textStyle: const TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 14,
            letterSpacing: 0.20,
            fontWeight: FontWeight.normal,
          )), // Button color
    ),
    cardTheme: CardTheme(
      color: Colors.white, // Card background color
      shadowColor: Colors.grey.shade400, // Shadow color
      elevation: 4,
    ),
    iconTheme: const IconThemeData(color: Color(0xFF1E1E1E)), // Icon color
  );
}
