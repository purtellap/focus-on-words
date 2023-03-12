import 'package:flutter/material.dart';
import 'package:focus_on_words_app/data/book.dart';
import 'package:focus_on_words_app/data/provider/books.dart';
import 'package:focus_on_words_app/data/provider/favorites.dart';
import 'package:focus_on_words_app/res/res.dart';
import 'package:provider/provider.dart';

class BookPage extends StatelessWidget {
  final Book book;
  const BookPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Consumer<BooksProvider>(
      builder: (context, bp, child) {
        return Consumer<FavoritesProvider>(
          builder: (context, fp, child) {
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
          },
        );
      },
    );
  }
}
