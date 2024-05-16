import 'package:flutter/material.dart';

class TColors {
  TColors._();

  // App Basic Colors
  static const Color primary = Color(0xff3c5b6f);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);

  // Gradient Colors 
  static const Gradient linerGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffff9a9a),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ]
  );

  // Text Colors
  static const Color textPrimary = Color(0xff3c5b6f);
  static const Color textSecondary = Color(0xff3c5b6f);
  static const Color textWhite = Color(0xff3c5b6f);

  // Backround Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackround = Color(0xFFF3F5FF);

  // Backround Container Colors 
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = TColors.accent.withOpacity(0.1);

  // Button Colors 
  static const Color buttonPrimary = Color(0xff3c5b6f);
  static const Color buttonSecondary = Color(0xff3c5b6f);
  static const Color buttonDisabled = Color(0xff3c5b6f);

  // Border Colors
  static const Color borderPrimary = Color(0xff3c5b6f);
  static const Color borderSecondary = Color(0xff3c5b6f);

  // Error and Validation Colors 
  static const Color error = Color(0xFFD32F2F);
  static const Color succes = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);
  
  // Natural Shades 
  static const Color black =  Color(0xFF232323);
  static const Color darkerkgrey =  Color(0xFF4F4F4F);
  static const Color darkGrey =  Color(0xFF939393);
  static const Color grey =  Color(0xFFE0E0E0);
}
