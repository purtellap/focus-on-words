import 'package:flutter/material.dart';
import 'package:focus_on_words_app/res/res.dart';
import 'package:focus_on_words_app/view/widgets/bottom_navigation_bar.dart';

class MaterialScaffold extends StatelessWidget {
  final Widget child;

  /// Primary Scaffold to wrap page content
  const MaterialScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: const BottomNavigation(),
      body: Container(
        decoration: const BoxDecoration(color: ThemeColors.backgroundColor),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: child,
          ),
        ),
      ),
    );
  }
}
