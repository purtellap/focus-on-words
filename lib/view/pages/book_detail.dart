import 'package:flutter/material.dart';
import 'package:focus_on_words_app/data/book.dart';
import 'package:focus_on_words_app/data/provider/bonus.dart';
import 'package:focus_on_words_app/data/provider/books.dart';
import 'package:focus_on_words_app/data/provider/favorites.dart';
import 'package:focus_on_words_app/res/res.dart';
import 'package:focus_on_words_app/view/widgets/bonus_card.dart';
import 'package:provider/provider.dart';

class BookPage extends StatelessWidget {
  final Book book;
  const BookPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Consumer<BooksProvider>(
      builder: (context, bp, child) {
        return Consumer<BonusProvider>(
          builder: (context, bonus, child) {
            return StreamBuilder<bool>(
              stream: bonus.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  showBonusMessage(context);
                }
                return Consumer<FavoritesProvider>(
                  builder: (context, fp, child) {
                    bool isFavorite = fp.isFavorite(book.id);
                    return Scaffold(
                      backgroundColor: ThemeColors.backgroundColor,
                      appBar: AppBar(
                        elevation: 0,
                        leadingWidth: 88,
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: IconButton(
                              splashRadius: Dimens.splashRadius,
                              onPressed: () => fp.favorite(book.id),
                              icon: isFavorite
                                  ? const Icon(Icons.favorite,
                                      color: ThemeColors.favoritedColor)
                                  : const Icon(Icons.favorite_border,
                                      color: ThemeColors.secondaryTextColor),
                            ),
                          ),
                        ],
                      ),
                      body: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 48),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimens.borderRadius),
                                      color: ThemeColors.cardColor,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    book.title,
                                    textAlign: TextAlign.left,
                                    style: TextStyles.text,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    book.author,
                                    textAlign: TextAlign.left,
                                    style: TextStyles.subtext,
                                  ),
                                  const SizedBox(height: 32),
                                  Text(
                                    book.description,
                                    textAlign: TextAlign.left,
                                    style: TextStyles.subtext
                                        .copyWith(color: ThemeColors.textColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
