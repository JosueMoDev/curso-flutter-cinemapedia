import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pinkAccent.shade700,
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 48.0, fontWeight: FontWeight.w400, letterSpacing: 0),
          displayMedium: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w400, letterSpacing: 0),
          displaySmall: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w400, letterSpacing: 0),
          headlineLarge: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w600, letterSpacing: 0),
          headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400, letterSpacing: 0),
          headlineSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400, letterSpacing: 0),
          titleLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, letterSpacing: 0),
          titleMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, letterSpacing: 0),
          titleSmall: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, letterSpacing: 0),
          bodyLarge: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, letterSpacing: 0),
          bodyMedium: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w400, letterSpacing: 0),
          bodySmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400, letterSpacing: 0),
        ),
      );
}
