import 'package:flutter/material.dart';
import 'package:focus_on_words_app/data/book.dart';
import 'package:focus_on_words_app/res/res.dart';

class BookCard extends StatelessWidget {
  final Book book;
  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColors.cardColor,
        borderRadius: BorderRadius.circular(Dimens.borderRadius),
        image: DecorationImage(
          colorFilter:
              const ColorFilter.mode(Color(0xaa000000), BlendMode.hardLight),
          fit: BoxFit.cover,
          image: NetworkImage(book.thumbnail),
        ),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  book.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                book.authors,
                style: const TextStyle(
                  color: ThemeColors.secondaryTextColor,
                ),
                overflow: TextOverflow.clip,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
