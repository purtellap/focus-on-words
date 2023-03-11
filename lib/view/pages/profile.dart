import 'package:flutter/material.dart';
import 'package:focus_on_words_app/res/res.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          Strings.myProfile,
          textAlign: TextAlign.left,
          style: TextStyles.title,
        ),
        const SizedBox(height: 16),
        Card(
          color: const Color(0xff0a0a0a),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.borderRadius),
          ),
          child: const SizedBox(height: 256),
        ),
      ],
    );
  }
}
