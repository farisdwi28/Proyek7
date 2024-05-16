import 'package:alfariz_property/utils/constants/colors.dart';
import 'package:flutter/material.dart';

/// -- Light & Dark Elavated Button Themes
class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  /// -- Light Theme
  static final lightElevatedTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: TColors.primary,
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.grey,
    // side: const BorderSide(color: Colors.blue),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));

  /// -- Dark Theme
  static final darkElavatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: TColors.primary,
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.grey,
    // side: const BorderSide(color: Colors.blue),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));
}
