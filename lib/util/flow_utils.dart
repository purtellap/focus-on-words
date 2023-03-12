import 'package:flutter/material.dart';
import 'package:focus_on_words_app/data/book.dart';
import 'package:focus_on_words_app/res/res.dart';

// Helper methods for navigation
class FlowUtils {
  /// Bottom nav
  static void pushNav(BuildContext context, String route) {
    Navigator.pushReplacementNamed(context, route);
  }

  /// New screen
  static void pushBookDetail(BuildContext context, Book book) {
    Navigator.pushNamed(context, Keys.book, arguments: book);
  }

  /// Get arguments
  static Book? getBookFromArgs(Object? object) {
    try {
      return object as Book;
    } catch (e) {
      return null;
    }
  }
}
