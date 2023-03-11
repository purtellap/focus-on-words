import 'package:flutter/material.dart';
import 'package:focus_on_words_app/res/res.dart';

class ErrorPage extends StatelessWidget {
  /// Returns 404 page
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: SelectableText(
        Strings.error,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black87, fontSize: 36, fontWeight: FontWeight.bold),
      ),
    );
  }
}
