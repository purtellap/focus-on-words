import 'package:flutter/material.dart';

class Keys {
  // Routes
  static const String home = '/';
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
  static const Color cardColor = Color(0xff0a0a0a);
  static const Color overlayColor = Color(0x11ffffff);
  static const Color textColor = Colors.white;
  static const Color secondaryTextColor = Colors.grey;

  // Accent Colors
  static const Color underlineColor = Color(0x44000000);
  static const Color favoritedColor = Color(0xff662233);
  static const Color selectionColor = Color(0x66888888);
  static const Color linkColor = Color(0xaaaaaaaa);
}

class Strings {
  static const String error = '404: Page not found';

  // Home
  static const String explore = 'Explore';

  // Profile
  static const String myProfile = 'My profile';
  static const String username = '@username';
  static const String followers = 'followers';
  static const String favorites = 'Favorites';
}

class TextStyles {
  static const TextStyle title = TextStyle(
      color: ThemeColors.textColor, fontSize: 24, fontWeight: FontWeight.bold);
  static const TextStyle text = TextStyle(
      color: ThemeColors.textColor, fontSize: 20, fontWeight: FontWeight.bold);
  static const TextStyle subtext =
      TextStyle(color: ThemeColors.secondaryTextColor, fontSize: 16);
}
