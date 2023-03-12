import 'package:flutter/material.dart';
import 'package:focus_on_words_app/data/provider/books.dart';
import 'package:focus_on_words_app/data/provider/favorites.dart';
import 'package:focus_on_words_app/res/res.dart';
import 'package:focus_on_words_app/util/flow_utils.dart';
import 'package:focus_on_words_app/view/widgets/book_card.dart';
import 'package:provider/provider.dart';

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
        Expanded(child: _BooksList()),
      ],
    );
  }
}

class _BooksList extends StatelessWidget {
  const _BooksList();

  @override
  Widget build(BuildContext context) {
    return Consumer<BooksProvider>(
      builder: (context, bp, child) {
        return Consumer<FavoritesProvider>(
          builder: (context, fp, child) {
            return Column(
              children: [
                // Search bar
                Expanded(
                  child: GridView.builder(
                    itemCount: bp.books.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (_, int i) {
                      return InkWell(
                        onTap: () =>
                            FlowUtils.pushBookDetail(context, bp.books[i]),
                        child: GridTile(
                          child: BookCard(book: bp.books[i]),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
