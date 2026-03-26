import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color background = Color(0xFFF7F8FA);
  static const Color primaryBlue = Color(0xFF2563EB);
  static const Color lightBlue = Color(0xFFEFF6FF);
  static const Color accentOrange = Color(0xFFF97316);
  static const Color textDark = Color(0xFF111827);
  static const Color textMuted = Color(0xFF6B7280);
  static const Color cardWhite = Colors.white;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      primaryColor: primaryBlue,
      colorScheme: const ColorScheme.light(
        primary: primaryBlue,
        secondary: accentOrange,
        surface: cardWhite,
        onSurface: textDark,
      ),
      textTheme: GoogleFonts.outfitTextTheme().apply(
        bodyColor: textDark,
        displayColor: textDark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        iconTheme: IconThemeData(color: textDark),
        centerTitle: true,
      ),
    );
  }
}
