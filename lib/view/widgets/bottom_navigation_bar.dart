import 'package:flutter/material.dart';
import 'package:focus_on_words_app/data/bottom_navigation.dart';
import 'package:focus_on_words_app/res/res.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, provider, child) {
        return BottomNavigationBar(
          backgroundColor: ThemeColors.backgroundColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: ThemeColors.textColor,
          unselectedItemColor: ThemeColors.secondaryTextColor,
          currentIndex: provider.index,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 28),
              label: Keys.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, size: 28),
              label: Keys.favorites,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 28),
              label: Keys.profile,
            )
          ],
          onTap: (value) {
            provider.navigateTo(context, value);
          },
        );
      },
    );
  }
}
