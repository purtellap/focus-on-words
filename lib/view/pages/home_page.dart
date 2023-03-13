import 'package:flutter/material.dart';
import 'package:focus_on_words_app/data/book.dart';
import 'package:focus_on_words_app/data/provider/bonus.dart';
import 'package:focus_on_words_app/data/provider/books.dart';
import 'package:focus_on_words_app/res/res.dart';
import 'package:focus_on_words_app/util/flow_utils.dart';
import 'package:focus_on_words_app/view/widgets/bonus_card.dart';
import 'package:focus_on_words_app/view/widgets/book_card.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
              },
            );
          },
        );
      },
    );
  }
}

class _BooksList extends StatefulWidget {
  const _BooksList();

  @override
  State<_BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<_BooksList> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    BooksProvider bp = context.read<BooksProvider>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: TextField(
            onChanged: (value) => setState(() {
              _query = value;
            }),
            decoration: InputDecoration(
              filled: true,
              fillColor: ThemeColors.cardColor,
              prefixIcon: const Icon(
                Icons.search,
                color: ThemeColors.textFieldColor,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(Dimens.borderRadius),
                ),
              ),
              hintText: Strings.filter,
              hintStyle: TextStyles.subtext.copyWith(
                fontSize: 14,
                color: ThemeColors.textFieldColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: FutureBuilder(
              future: bp.searchBooks(_query.toLowerCase().trim()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Book> books = snapshot.data ?? [];
                  return GridView.builder(
                    itemCount: books.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (_, int i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () =>
                              FlowUtils.pushBookDetail(context, books[i]),
                          child: GridTile(
                            child: BookCard(book: books[i]),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
        ),
      ],
    );
  }
}
