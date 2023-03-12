import 'package:flutter/material.dart';
import 'package:focus_on_words_app/data/book.dart';
import 'package:focus_on_words_app/data/provider/books.dart';
import 'package:focus_on_words_app/data/provider/favorites.dart';
import 'package:focus_on_words_app/res/res.dart';
import 'package:focus_on_words_app/util/flow_utils.dart';
import 'package:focus_on_words_app/view/widgets/book_card.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundColor: ThemeColors.textColor,
              radius: 32,
              child: Icon(Icons.person, size: 32),
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                const Text(
                  Strings.username,
                  textAlign: TextAlign.left,
                  style: TextStyles.text,
                ),
                const SizedBox(height: 4),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '0  ',
                        style: TextStyles.subtext.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.textColor),
                      ),
                      const TextSpan(
                        text: Strings.followers,
                        style: TextStyles.subtext,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Text(
          Strings.favorites,
          textAlign: TextAlign.left,
          style: TextStyles.text,
        ),
        const SizedBox(height: 16),
        const Expanded(child: _FavoritesList()),
      ],
    );
  }
}

class _FavoritesList extends StatelessWidget {
  const _FavoritesList();

  @override
  Widget build(BuildContext context) {
    return Consumer<BooksProvider>(builder: (context, bp, child) {
      return Consumer<FavoritesProvider>(
        builder: (context, fp, child) {
          List<Book> books = fp.favoriteBooks(bp.books);
          return GridView.builder(
            itemCount: books.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (_, int i) {
              return InkWell(
                onTap: () => FlowUtils.pushBookDetail(context, books[i]),
                child: GridTile(
                  child: BookCard(book: books[i]),
                ),
              );
            },
          );
        },
      );
    });
  }
}
