import 'package:flutter/material.dart';
import 'package:focus_on_words_app/res/res.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text(
          Strings.explore,
          textAlign: TextAlign.left,
          style: TextStyles.title,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
