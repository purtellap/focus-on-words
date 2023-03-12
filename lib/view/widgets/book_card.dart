import 'package:flutter/material.dart';
import 'package:focus_on_words_app/data/book.dart';
import 'package:focus_on_words_app/res/res.dart';

class BookCard extends StatelessWidget {
  final Book book;
  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ThemeColors.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.borderRadius),
      ),
      // child: const Align(
      //   alignment: Alignment.bottomRight,
      //   child: Padding(
      //     padding: EdgeInsets.all(16),
      //     child: Icon(
      //       Icons.favorite,
      //       color: ThemeColors.favoritedColor,
      //     ),
      //   ),
      // ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                book.author,
                style: const TextStyle(
                  color: ThemeColors.secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
