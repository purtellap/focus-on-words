import 'package:flutter/material.dart';
import 'package:focus_on_words_app/res/res.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text(
          Strings.myFavorites,
          textAlign: TextAlign.left,
          style: TextStyles.title,
        ),
      ],
    );
  }
}
