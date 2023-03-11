import 'package:flutter/material.dart';

// Helper methods for navigation
class FlowUtils {

  /// Bottom nav
  static void pushNav(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  /// New screen
  static void push(BuildContext context, String route) {}
}
