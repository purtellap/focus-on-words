import 'package:flutter/material.dart';
import 'package:focus_on_words_app/res/res.dart';
import 'package:focus_on_words_app/view/widgets/bottom_navigation_bar.dart';

class MaterialScaffold extends StatelessWidget {
  final Widget child;

  const MaterialScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor,
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: child,
        ),
      ),
    );
  }
}
