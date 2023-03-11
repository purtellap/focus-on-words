import 'package:flutter/material.dart';

class Keys {
  // Routes
  static const String home = '/';
  static const String favorites = '/favorites';
  static const String profile = '/profile';
  static const String book = '/book';
}

class Dimens {
  static const double mobileConstraint = 800;
  static const double borderRadius = 8;
  static const double splashRadius = 24;
}

class ThemeColors {
  // Dark Theme
  static const Color backgroundColor = Color(0xFF121212);
  static const Color overlayColor = Color(0x11ffffff);
  static const Color textColor = Colors.white;
  static const Color secondaryTextColor = Colors.grey;

  // Accent Colors
  static const Color underlineColor = Color(0x44000000);
  static const Color selectionColor = Color(0x66888888);
  static const Color linkColor = Color(0xaaaaaaaa);
}

class Strings {
  static const String explore = 'Explore';
  static const String myFavorites = 'My favorites';
  static const String myProfile = 'My profile';
  static const String error = '404: Page not found';
}

class TextStyles {
  static const TextStyle title = TextStyle(
      color: ThemeColors.textColor, fontSize: 24, fontWeight: FontWeight.bold);
}
